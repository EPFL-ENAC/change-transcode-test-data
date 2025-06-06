# URBES-utc-test-data
This repository contains test data for the translation of the UrbanTethysChloris.jl package from MATLAB to Julia, along with the code necessary to create it. Currently, the test data is limited to the Zurich test case, but will be expanded to include other test cases in the future.

## Requirements
- `MATLAB` installed and in the system path
- `make` command available in the terminal

## Usage

### Updating the data
⚠️ The data only needs to be re-created if changes were made to the original Urban Tethys & Chloris MATLAB repository.

If this is the case, first ensure that `MATLAB` is installed and in the system path. Then, run the following command in the terminal:

```bash
make all
```

This will generate the code necessary to extract the data from the first iteration of the Urban Tethys & Chloris MATLAB simulation, and save it in the `test/translation/matlab/data` directory.

### Adding handwritten wrappers

Some of the MATLAB functions used in the Urban Tethys & Chloris simulation are not directly generalizable via the wrapper template and require specific handwritten wrappers. These wrappers can be added to the `test/translation/matlab/wrappers` directory and the function name should be added to the list of excluded functions in `exclded_functions.txt`.
