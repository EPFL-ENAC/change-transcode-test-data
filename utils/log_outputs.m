function log_outputs(id_location, funcName, outputs)
% LOG_OUTPUTS Logs outputs to a JSON file, replacing NaN and Inf with strings

    persistent loggedFunctions
    if isempty(loggedFunctions)
        loggedFunctions = containers.Map();
    end
    key = strcat(funcName, "_", id_location);
    if isKey(loggedFunctions, key)
        return;
    end
    loggedFunctions(funcName) = true;

    % Make output directory
    outputDir = fullfile('..', 'data', id_location, 'output');
    if ~exist(outputDir, 'dir')
        mkdir(outputDir);
    end

    % Convert NaN and Inf to strings in the top-level struct
    fields = fieldnames(outputs);
    for i = 1:numel(fields)
        val = outputs.(fields{i});
        if isnumeric(val) && isscalar(val)
            if isnan(val)
                outputs.(fields{i}) = 'NaN';
            elseif isinf(val)
                outputs.(fields{i}) = 'Inf';
                if val < 0
                    outputs.(fields{i}) = '-Inf';
                end
            end
        end
    end

    % Encode to JSON
    if verLessThan('matlab', '9.11')
        jsonStr = jsonencode(outputs);
    else
        jsonStr = jsonencode(outputs, 'PrettyPrint', true);
    end

    % Write file
    filename = fullfile(outputDir, [funcName '.json']);
    fid = fopen(filename, 'w');
    fwrite(fid, jsonStr, 'char');
    fclose(fid);
end

