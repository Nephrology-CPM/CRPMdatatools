# CRPMdatatools
Data Tools for the Center of Renal Precision Medicine

## Getting Started
This project is based on a
[standard install of anaconda](https://docs.anaconda.com/anaconda/install/).
Please install anaconda before proceeding.

Just in case you are not already there,
open a terminal and navigate to this project directory
```sh
$ cd /path/to/this/project/CRPMdatatools
```

Create a virtual environment from the provided `environtment.yml` file.
*(Optional: For more details refer to [this usefull guide](https://uoa-eresearch.github.io/eresearch-cookbook/recipe/2014/11/20/conda/)
and [this other guide](https://samrelton.wordpress.com/2015/07/02/rconda/).)*
```
$ conda env create  
```
Proceed with adding all the new packages by pressing `y`.
Now, switch to this new environment.
```
$ source activate CRPMdatatools
```
Now, You can simply launch R, or Rscript as normally.
```
$ R
or
$ Rscript
```
When finished, deactivate the environment and end your session.
```
$ source deactivate
```

## [Development Log](devlog.md)
