function duplicate_package(sourceDir, destDir, originalPrefix)
    destPath = fullfile(destDir, strcat("+", originalPrefix));
    if ~exist(destPath, 'dir')
        mkdir(destPath);
    end
    % Copy all .m files
    mFiles = dir(fullfile(sourceDir, '*.m'));
    for f = 1:length(mFiles)
        copyfile(fullfile(sourceDir, mFiles(f).name), destPath);
    end
end
