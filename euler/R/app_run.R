#' Run the shiny application
#' @param doDebug boolean, whether to show debug options in the UI; default FALSE
#' @param ... further arguments that can be passed to \code{\link[shiny]{shinyApp}} options
#' @return shinyApp object, see also \code{\link[shiny]{shinyApp}}
#' @importFrom shiny shinyApp
#' @export
runShiny <- function(doDebug = FALSE, ...){
  
#  # normally in global.R
#   conn <- DBI::ANSI()
#   onStop(function(){ DBI::dbDisconnect(conn) })
  
  # Run the application
  shinyApp(
    ui = uiFunction(doDebug = doDebug), 
    server = serverFunction(),
    options = list(...)
  )
  
}




