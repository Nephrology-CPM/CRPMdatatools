library(CRPMdatatools)

context("Parsing gcms batch files")

test_that("example gcms batch file can be found.",{
  fpath <- file.path(system.file(package="CRPMdatatools"),
  "extdata", "test.xlsx")
  expect_true(file.exists(fpath))
})

test_that("xlsx files are supported",{
  fpath <- file.path(system.file(package="CRPMdatatools"),
  "extdata", "test.xlsx")
  expect_true(class(load_batch_file(fpath))=="data.frame")
})
