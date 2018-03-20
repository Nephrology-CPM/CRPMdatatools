#' Find metabolites in gcms batch dataframe.
#'
#' @return An array with the names of unique metabolites found.
#'
#' @export
#' @author Daniel Montemayor, \email{montemayord2@uthscsa.edu}
get_metabolite_names <- function(df){
  return(names(table(factor(df$Peak.Name))))
}
