function log_inputs(id_location, funcName, inputs)
% LOG_INPUTS Logs inputs to a JSON file, replacing NaN and Inf with strings

    persistent loggedFunctions
    if isempty(loggedFunctions)
        loggedFunctions = containers.Map();
    end
    key = strcat(funcName, "_", id_location);
    if isKey(loggedFunctions, key)
        return;
    end
    loggedFunctions(funcName) = true;

    % Make input directory
    inputDir = fullfile('..', 'data', id_location, 'input');
    if ~exist(inputDir, 'dir')
        mkdir(inputDir);
    end

    % Convert NaN and Inf to strings in top-level fields
    fields = fieldnames(inputs);
    for i = 1:numel(fields)
        val = inputs.(fields{i});
        if isnumeric(val) && isscalar(val)
            if isnan(val)
                inputs.(fields{i}) = 'NaN';
            elseif isinf(val)
                inputs.(fields{i}) = 'Inf';
                if val < 0
                    inputs.(fields{i}) = '-Inf';
                end
            end
        end
    end

    % Encode to JSON
    if verLessThan('matlab', '9.11')
        jsonStr = jsonencode(inputs);
    else
        jsonStr = jsonencode(inputs, 'PrettyPrint', true);
    end

    % Write file
    filename = fullfile(inputDir, [funcName '.json']);
    fid = fopen(filename, 'w');
    fwrite(fid, jsonStr, 'char');
    fclose(fid);
end
