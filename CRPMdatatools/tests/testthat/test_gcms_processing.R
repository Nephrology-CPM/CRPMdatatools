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

test_that("a blank workbook can be created.",{
expect_true(is.null(xlsx::getSheets(init_workbook())))
})
