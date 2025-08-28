# change-transcode-test-data
This repository contains test data for the translation of the Tethys & Chloris.jl package from MATLAB to Julia, along with the code necessary to create it. Currently, the test data is limited to the Zurich and Vaira test cases, but will be expanded to include other test cases in the future.

## Requirements
- `MATLAB` installed and in the system path
- `make` command available in the terminal
- `Data_US-Var_run.mat` file available in the `data` directory. This data should be requested from the authors.

## Usage

### Updating the data
⚠️ The data only needs to be re-created if changes were made to the original Tethys & Chloris MATLAB repository.

If this is the case, first ensure that `MATLAB` is installed and in the system path. Then, run the following command in the terminal:

```bash
make all
```

This will generate the code necessary to extract the data from the first iteration of the Tethys & Chloris MATLAB simulation, and save it in the `data` directory.

### Adding handwritten wrappers

Some of the MATLAB functions used in the Tethys & Chloris simulation are not directly generalizable via the wrapper template and require specific handwritten wrappers. These wrappers can be added to the `test/translation/matlab/wrappers` directory and the function name should be added to the list of excluded functions in `excluded_functions.txt`.
