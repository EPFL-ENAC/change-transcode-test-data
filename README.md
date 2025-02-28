_Test data and generation scripts for the translation of [TeC](https://github.com/CHANGE-EPFL/TeC_Source_Code) (MATLAB) into [TethysChloris.jl](https://github.com/CHANGE-EPFL/TethysChloris.jl) (Julia)._


# Usage

This repository if meant to be used as a submodule of [TethysChloris.jl](https://github.com/CHANGE-EPFL/TethysChloris.jl). If you want to clone it separately, use the following command:

```bash
git clone --recurse-submodules git@github.com:CHANGE-EPFL/TethysChloris.jl.git
```

If you already cloned the repository without the TeC submodule, you can fetch it using the following command:

```bash
git submodule update --init --recursive
```


# Structure

- `data/`: Contains the test data for testing the MATLAB to Julia translation.
- `generation_scripts/`: Contains the MATLAB scripts used to generate the test data.
- `TeC/`: Contains the original TeC MATLAB code (submodule).
