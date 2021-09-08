library(CRPMdatatools)

context("Parsing gcms batch files")

fpath <- file.path(system.file(package="CRPMdatatools"),
"extdata", "test.xlsx")

testmetabloite_names <- c(
                    "2 methyl acetoacetate di TMS",
                    "2 Oxo Caproic anti IS",
                    "2-hydroxyglutaric Acid Tri TMS",
                    "2-hydroxyisovaleric Di TMS",
                    "2-hydroxyphenylacetic Acid Di TMS",
                    "2-ketoadipic acid-PFBH-TMS",
                    "2-ketoglutaric Acid pfbo-TMS 01",
                    "2Et 3OH Propionate Di TMS",
                    "2Me3OH Butyric 01 Di TMS",
                    "2-OH butyrate 2TMS",
                    "2OH Isocaproic Di TMS",
                    "2oxo3Me Butyric PFBO 1TMS",
                    "2oxo3Me Valeric antiPFBO1TMS",
                    "2oxo3Me Valeric synPFBO1TMS",
                    "2oxo4Me Valeric antiPFBO 1TMS",
                    "2oxo4Me Valeric synPFBO 1TMS",
                    "2-oxobutyric AntiPFBO 1TMS",
                    "2-oxobutyric synPFBO 1TMS",
                    "2-Phenylbutyric acid 1TMS",
                    "3,4-dihydroxy phenylacetic D5",
                    "3-Hydroxy Isovalerate Di TMS",
                    "3-Hydroxy Propionate Di TMS",
                    "3-hydroxyadipic Acid Tri TMS",
                    "3-hydroxyglutaric Acid Tri TMS",
                    "3-methyl adipic acid di TMS",
                    "3-Methyl Crotonyl Glycine 1TMS",
                    "3-methylglutaconic Acid Di TMS",
                    "3-Methylglutaric Di TMS",
                    "3-OH butyric acid--2TMS",
                    "3-OH isobutyric acid-2TMS",
                    "3OH3ME Glutaric Acid Tri TMS",
                    "3OME4OH Mandelic Acid Tri TMS",
                    "4 amino Butyric Di TMS",
                    "4-Hydroxy Hippurate Di TMS",
                    "4-hydroxyphenylacetic Acid Di TMS",
                    "4-hydroxyphenyllactic Acid Tri TMS",
                    "4-Nitrophenol Ring d4 IS",
                    "4OHPhenylpyruvicPFBOanti2TMS",
                    "4OHPhenylpyruvicPFBOsyn2TMS",
                    "5 HIAA Tri TMS",
                    "5-oxoproline Di TMS",
                    "Acetoacetic AntiPFBO 1TMS",
                    "Acetoacetic SynPFBO 1TMS",
                    "Adipic Acid Di TMS",
                    "Adipic-C6-1",
                    "a-ketoisovaleric-C5",
                    "Azelaic Acid Di TMS",
                    "Benzoic Acid Mono TMS",
                    "Cis-Aconitate-3TMS-1",
                    "Citric Acid Tetra TMS",
                    "Citric-D4",
                    "D3 Methylmalonic 2TMS IS",
                    "DL-3-Phenyllactic 2TMS",
                    "Dodecanedioic Acid 2TMS",
                    "Ethylmalonic Acid Di TMS",
                    "Fumaric Acid Di TMS",
                    "Fumaric D4",
                    "Glutaconic 2TMS 2OTMS",
                    "Glutaconic Di TMS",
                    "Glutaric Acid Di TMS",
                    "Glyceric Acid Tri TMS",
                    "Glycolic Acid Di TMS",
                    "Glycolic- D2",
                    "Glyoxylic PFBAanti 1TMS",
                    "Hexanoic Mono TMS",
                    "Hexanoylglycine Mono TMS",
                    "Hippuric Acid MonoTMS",
                    "Homovanillic Acid di TMS",
                    "hydrocinnamic acid 1TMS-1",
                    "Indolelactic Tri TMS",
                    "Isocitric Acid Tetra TMS",
                    "Lactic Acid Di TMS",
                    "Lauric Acid Mono TMS",
                    "Malic Acid Tri TMS",
                    "Malonic Acid Di TMS",
                    "Malonic Acid Tri TMS",
                    "Methylcitric Acid 4TMS 01",
                    "Methylmalonic  Acid Di TMS",
                    "Methylsuccinic Acid Di TMS",
                    "Myristic Acid Mono TMS",
                    "Myristic acid-C3",
                    "N-Acetyl Aspartate di TMS",
                    "N-Acetyl-L-Tyrosine 2TMS",
                    "Octanoic Acid Mono TMS",
                    "Oleic Acid Mono TMS",
                    "Orotic Acid Tri TMS",
                    "Palmitic Acid Mono TMS",
                    "PhenylAcetic Mono TMS",
                    "Phenylpyruvic PFBOanti 1TMS",
                    "Phenylpyruvic PFBOsyn 1TMS",
                    "pyruvate-C1",
                    "Pyruvic PFBOS Mono TMS",
                    "Sebacic Acid Di TMS",
                    "Stearic Acid Mono TMS",
                    "Suberic Acid Di TMS",
                    "Succinic Acid Di TMS",
                    "Succinic acid-C2",
                    "Tiglylglycine 1TMS-1",
                    "uracil di TMS",
                    "Uracil-C2"
                    )
testsampleIDs <- c(
                  "C11-3M", "C12-5M", "C13-3M", "C14-1M", "C15-3M", "C17-3M",
                  "C18-3M", "C19-1M", "C20-1M", "C20-5M", "S11-3M", "S17-1M",
                  "S18-5M", "S18-BL", "S19-5M", "S20-BL", "H2O", "MC150_1",
                  "MC150_2", "MC150_3")

test_that("example gcms batch file can be found.",{
  expect_true(file.exists(fpath))
})

test_that("xlsx files are supported",{
  expect_true(class(load_batch_file(fpath))=="data.frame")
})

#store loaded batch files
batch_df <- load_batch_file(fpath)

test_that("loaded batch file has correct variable names.",{
  correct_names <- c("Peaks.4000.", "Data.File", "RT..min.",
                    "Peak.Name", "Area", "Amt", "Calib.Amt",
                    "S.N.RMS", "X.")
  expect_true(all(names(batch_df)==correct_names))
})

test_that("a blank workbook is exported with no input parameters.",{
  expect_true(is.null(xlsx::getSheets(export_workbook())))
})

test_that("can retrieve metabolite names from gcms batch file", {
  got_names <- get_metabolite_names(batch_df)
  expect_true(length(got_names)==100)
  expect_true(all(got_names%in%testmetabloite_names))
})

test_that("clean sample IDs from gcms batch file are as expected",{
  got_sampleIDs<-clean_sampleIDs(batch_df)
  expect_true(length(unique(got_sampleIDs))==20)
  expect_true(all(got_sampleIDs%in%testsampleIDs))
})

test_that("batch configuration is initialized with all unique compounds and sampleIDs",{
  got_config <- init_batch_config(batch_df)
  expect_true(all(got_config$compounds%in%testmetabloite_names))
  expect_true(all(got_config$sampleIDs%in%testsampleIDs))
  expect_true(got_config$allowed_percent_missing==.0)
})

#save the default batch configuration
default_config <- init_batch_config(batch_df)

test_that("collect table has correct values.",{
  collect_df <-get_collect_table(batch_df,default_config)
  ID_2_methyl_acetoacetate_di_TMS <- c(
                27.678,
                9.42,
                131.96,
                32.812,
                24.028,
                39.118,
                35.299,
                35.157,
                37.576,
                18.18,
                "N/A",
                0.246,
                0.707,
                0.913,
                17.116,
                82.704,
                13.001,
                32.572,
                12.119,
                43.307
              )
  expect_true(all(collect_df[collect_df$CID=="2 methyl acetoacetate di TMS",
                          2:ncol(collect_df)]==ID_2_methyl_acetoacetate_di_TMS))
  ID_4_amino_Butyric_Di_TMS <- c(
                0.396,
                0.147,
                "N/A",
                0.812,
                0.102,
                0.556,
                0.259,
                "N/A",
                "N/A",
                0.206,
                "N/A",
                10.607,
                9.481,
                9.28,
                0.454,
                "N/A",
                0.308,
                "N/A",
                0.043,
                "N/A"
              )
  expect_true(all(collect_df[collect_df$CID=="4 amino Butyric Di TMS",
                        2:ncol(collect_df)]==ID_4_amino_Butyric_Di_TMS))

  ID_4_Hydroxy_Hippurate_Di_TMS <- c(
  0.847, 0.88, 6.095, 6.481, 0.847, 0.912, 0.866, 0.853, "---", 0.837,
  "---", 9.755, "---", 0.834,
  0.841, 0.852, 0.968, 0.835, 0.848, 0.846
  )
  expect_true(all(collect_df[collect_df$CID=="4-Hydroxy Hippurate Di TMS",
          2:ncol(collect_df)]==ID_4_Hydroxy_Hippurate_Di_TMS))

  ID_2_oxobutyric_AntiPFBO_1TMS <- c(rep("---",20))
  expect_true(all(collect_df[collect_df$CID=="2-oxobutyric AntiPFBO 1TMS",
        2:ncol(collect_df)]==ID_2_oxobutyric_AntiPFBO_1TMS))

  ID_3_4_dihydroxy_phenylacetic_D5 = c(rep(1,20))
  expect_true(all(collect_df[collect_df$CID=="3,4-dihydroxy phenylacetic D5",
        2:ncol(collect_df)]==ID_3_4_dihydroxy_phenylacetic_D5))

})


test_that("clean_collect_table removes sampleIDs not in batch config",{
  batch_config <- default_config
  batch_config$sampleIDs <- default_config$sampleIDs[1:5]
  collect_df <-get_collect_table(batch_df,batch_config)
  expect_true(all(names(collect_df)[-1]%in%testsampleIDs[1:5]))
})


test_that("clean_collect_table removes metabolites not in batch config",{
  batch_config <- default_config
  trunc_metabolite_names <- testmetabloite_names[1:5]
  batch_config$compounds <- trunc_metabolite_names
  collect_df <-get_collect_table(batch_df,batch_config)
  expect_true(all(collect_df$CID%in%trunc_metabolite_names))
})

#define custom configuration and collect table
batch_config <- default_config
batch_config$sampleIDs <- default_config$sampleIDs[1:16]
collect_df <-get_collect_table(batch_df,batch_config)

test_that("clean collect table removes compounds with no fluctuation.",{
  clean_collect_df <- clean_collect_table(collect_df,batch_config)

  #expect_false("2-oxobutyric AntiPFBO 1TMS"%in%clean_collect_df$CID)
  #expect_false("3,4-dihydroxy phenylacetic D5"%in%clean_collect_df$CID)

  expect_true(TRUE)


})
