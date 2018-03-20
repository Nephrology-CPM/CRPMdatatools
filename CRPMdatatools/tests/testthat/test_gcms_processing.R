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

test_that("loaded batch file has correct variable names.",{
  fpath <- file.path(system.file(package="CRPMdatatools"),
  "extdata", "test.xlsx")
  correct_names <- c("Peaks.4000.", "Data.File", "RT..min.",
                    "Peak.Name", "Area", "Amt", "Calib.Amt",
                    "S.N.RMS", "X.")
  expect_true(all(names(load_batch_file(fpath))==correct_names))
})

test_that("a blank workbook is exported with no input parameters.",{
  expect_true(is.null(xlsx::getSheets(export_workbook())))
})

test_that("can retrieve metabolite names from gcms batch file", {
  fpath <- file.path(system.file(package="CRPMdatatools"),
  "extdata", "test.xlsx")
  expect_true(length(get_metabolite_names(load_batch_file(fpath)))==100)
})

test_that("can retrieve sample IDs from gcms batch file",{
  fpath <- file.path(system.file(package="CRPMdatatools"),
  "extdata", "test.xlsx")
  expect_true(length(get_sampleIDs(load_batch_file(fpath)))==20)
})

test_that("collect table has correct values.",{
  fpath <- file.path(system.file(package="CRPMdatatools"),
  "extdata", "test.xlsx")
  batch_table <- load_batch_file(fpath)
  row1_values <- c(27.678, 9.42, 131.96, 32.812, 24.028, 39.118, 35.299, 35.157, 37.576, 18.18, 17.116, 82.704, 13.001, 32.572, 12.119, 43.307, NA, 0.246, 0.707, 0.913)
  row34_values <- c(0.396, 0.147, NA, 0.812, 0.102, 0.556, 0.259, NA, NA, 0.206, 0.454, NA, 0.308, NA, 0.043, NA, NA, 10.607, 9.481, 9.28)
  row35_values <- c(0.847, 0.88, 6.095, 6.481, 0.847, 0.912, 0.866, 0.853, NA, 0.837, 0.841, 0.852, 0.968, 0.835, 0.848, 0.846, NA, 9.755, NA, 0.834)
  expect_true(get_collect_table(batch_table)[1,]==row1_values)
  expect_true(get_collect_table(batch_table)[34,]==row34_values)
  expect_true(get_collect_table(batch_table)[35,]==row35_values)
})
