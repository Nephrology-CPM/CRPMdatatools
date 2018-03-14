# Development Log

### Initial Setup
  We follow the directions found in [this](http://r-pkgs.had.co.nz/intro.html) guide.
1. Initiate project metadata in R.
```R
> devtools::create("CRPMdatatools")
```
will create a project directory with
  + A stripped down `DESCRIPTION` file.
  + An R directory for code.
  + A .gitignore, .Rbuildignore, and a .Rproj file.

  Move these files out of this directory and into the
  main project directory.
1. Setup project to use testthat in R.
```R
> devtools::use_testhat()
```
will
  + Create a tests/testthat directory
  + Add testthat to the Suggests field in the `DESCRIPTION` file.
  + Creates a file tests/testthat.R that runs all tests.

### Workflow
1. Update the environment (if necessary)
```sh
$ conda env update
```
1. Activate the environment
```sh
$ source activate CRPMdatatools
```
1. Change to the project directory
1. Edit files
1. Launch R and run tests
```R
> devtools::test()
```
1. Launch R and update documentation.
```R
> devtools:document()
```
1. Deactivate environment
```sh
$ source deactivate
```
