addpath('utils')

% Read excluded functions from file
fid = fopen('excluded_functions.txt', 'r');
excluded_functions = textscan(fid, '%s');
fclose(fid);
excluded_functions = excluded_functions{1};

duplicate_package('TeC/T&C_Code', "wrapped", "tc");
generate_wrappers('TeC/T&C_Code', 'wrapped', 'tc', excluded_functions)