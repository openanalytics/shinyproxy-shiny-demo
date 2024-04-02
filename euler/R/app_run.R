#' Run the shiny application
#' @param ... further arguments that can be passed to \code{\link[shiny]{shinyApp}} options
#' @return shinyApp object, see also \code{\link[shiny]{shinyApp}}
#' @importFrom shiny shinyApp
#' @export
runShiny <- function(...){
  
  shinyApp(
    ui = uiFunction(), 
    server = serverFunction(),
    options = list(...)
  )
  
}




