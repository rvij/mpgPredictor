library(shiny)

# Define UI for dataset viewer application
shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Vehicle Miles Per Gallon (mpg) Predictor"),
  
    sidebarPanel(
      numericInput('wt', 'Weight lb/1000', 2.5, min = 1.5, max = 5, step = 0.1),
      selectInput("am", "Transmission:",
                  list("Automatic" = 0, 
                       "Manual"  = 1
                    )
                 ),
    numericInput('cyl', 'No. of Cylinders', 4, min = 4, max = 8, step = 2),
    submitButton('Submit')
    ),
    mainPanel(
        h3('Results of prediction'),
        h4('You entered weight:'),
        verbatimTextOutput("owt"),
        h4('You entered transmission type:'),
        verbatimTextOutput("oam"),
        h4('You entered # cylindesr:'),
        verbatimTextOutput("ocyl"),
        
        h4('Which resulted in a prediction of mpg of: '),
        verbatimTextOutput("prediction")
    )
  )
)
