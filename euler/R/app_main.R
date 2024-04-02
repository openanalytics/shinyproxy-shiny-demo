#' Main server function (like in server.R)
#' @return no return value
#' 
#' @import shiny
#' @import Rmpfr
#' @export
serverFunction <- function() {

  function(input, output, session) {

    output$result <- renderText({

      precisionBits <- input$precision
      one <- mpfr(1, precBits = precisionBits)
      e <- exp(one)
      # TODO fix printing...
      x <- capture.output(print(e, ndigits = precisionBits))[2]
      gsub("^\\[1\\] (.+)$", "\\1", x)


    })

  }

}


#' Main UI function (like in ui.R)
#' @param doDebug boolean, whether to show extra debug options in the UI
#' @return UI object 
#' 
#' @import shiny
#' @export
uiFunction <- function(doDebug) {

  function(request) {

    shinyUI(
      fluidPage(
        titlePanel("Euler's e in arbitrary precision", "Euler's e"),
        tags$br(),

        fluidRow(
          column(2, sliderInput("precision", "Number of Precision Bits", min = 2, max = 256,
                                value = 10))
        ),
        fluidRow(
          column(12, tags$h1(textOutput("result")))

        ),
        tags$br(),
        tags$p("We would like to acknowledge Leonhard Euler for his number and Martin Maechler for his Rmpfr package.")
      )
    )

  }

}
