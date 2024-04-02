test_that("Shiny App Starts", {
  shiny::testServer(app = runShiny(), {
    expect_true(TRUE)
  })
})
