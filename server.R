library(shiny)

mpgPredictor <- function(iwt, iam, icyl) {
	data(mtcars) 
	mtcars$cyl <- as.factor(mtcars$cyl)
	mtcars$am <- as.factor(mtcars$am)

	mpgModel <- lm(mpg ~ wt+am+cyl, data=mtcars)
	newdata = data.frame(wt=iwt, am=as.factor(iam), cyl=as.factor(icyl))
	predict(mpgModel,newdata)[[1]]
}

shinyServer(
  function(input, output) {
    output$owt <- renderPrint({input$wt})
#    output$oam <- renderPrint({input$am})
    output$oam <- renderPrint({ifelse(input$am == 0, "Automatic", "Manual")})
    output$ocyl <- renderPrint({input$cyl})
    
    output$prediction <- renderPrint({mpgPredictor(input$wt, input$am, input$cyl)})
  }
)
