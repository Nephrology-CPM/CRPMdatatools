library(CRPMdatatools)

context("valid input files")

test_that("xlsx files are supported",{
  expect_identical(class(load_batch_file(example.xlsx)),"data.frame")
})
