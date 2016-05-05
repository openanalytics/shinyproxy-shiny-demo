
#' Run the '01 hello' example application
#' @return no return value
#' @importFrom shiny runApp
#' @export
run_01_hello <- function(){

  shinyTmpDir <- tempdir()
  
  setwd(shinyTmpDir)
  
  # copy server.R, ui.R, www etc.
  shinyUiDir <- system.file("examples", "01_hello", package = "shiny")
  shinyUiFiles <- list.files(path = shinyUiDir, full.names = TRUE)
  sapply(shinyUiFiles, function(x){
        file.copy(from = x, to = file.path(shinyTmpDir, basename(x)),
            overwrite = TRUE, recursive = TRUE)}
  )
  
  runApp(appDir = shinyTmpDir)

}

#' Run the '06 tabsets' example application
#' @return no return value
#' @importFrom shiny runApp
#' @export
run_06_tabsets <- function(){
  
  shinyTmpDir <- tempdir()
  
  setwd(shinyTmpDir)
  
  # copy server.R, ui.R, www etc.
  shinyUiDir <- system.file("examples", "06_tabsets", package = "shiny")
  shinyUiFiles <- list.files(path = shinyUiDir, full.names = TRUE)
  sapply(shinyUiFiles, function(x){
        file.copy(from = x, to = file.path(shinyTmpDir, basename(x)),
            overwrite = TRUE, recursive = TRUE)}
  )
  
  runApp(appDir = shinyTmpDir)
  
}
