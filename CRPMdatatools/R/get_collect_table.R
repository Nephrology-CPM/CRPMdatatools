#' build gcms collect table
#'
#' @param df The dataframe result of load_batch_file
#' @param config the analysis configuration such as result of init_batch_config
#' @return A dataframe with gcms data collected from batch file.
#'
#' @export
#' @author Daniel Montemayor, \email{montemayord2@uthscsa.edu}
get_collect_table <- function(df,config){

  #check for data files with names that contain any of the config sample IDs
  keeprows <- apply(array(df$Data.File),1,
                function(y){
                  any(
                    apply(config$sampleIDs,1,
                      function(x){grepl(x,y)}
                    )
                  )
                }
              )

  #remove excluded data files
  df<-df[keeprows,]

  #clean remaining data file names into sampleIDs
  df$Data.File <- clean_sampleIDs(df)

  #keep Peak Names(metabolites) that appear in configuration compounds
  df<-df[df$Peak.Name%in%config$compounds,]

  #reshape df to display Amount of Peak.Name(metabolite) and Data.File(sample id)
  output <- reshape2::dcast(data = df, formula = df$Peak.Name~df$Data.File, value.var = "Amt")

  #correct 1st column name from df$Peak.Name to "CID" (compound identification)
  colnames(output)[1]="CID"

  #save output
  write.csv(output, file = "batch_collect.csv")

  return(output)
}
