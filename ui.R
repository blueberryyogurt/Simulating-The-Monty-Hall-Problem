
library(shiny)


shinyUI(fluidPage(
  
  title = "Monty Hall Simulation",
  
  titlePanel("Simulating the Monty Hall Problem"),
  
  h4("Don't believe in statistics? See what happens when you follow your instincts instead:"),
  
  textOutput("text0"),
  
  br(),
  
  textOutput("text00"),
  
  br(),
  
  plotOutput("Plot"),
  
  br(),
  
  fluidRow(
    column(4, offset = 1, h4("Play the game!"),
                          sliderInput("num",
                          "How many times would you like to play?",
                          min = 1,
                          max = 150,
                          value = 1),
                          helpText("HINT: See what happens as you play more games!"),
                          br()
    ),
    
    column(7,  h4("Outcomes:"), 
           tags$ul(tags$li(textOutput("text1"), tags$li(textOutput("text2")))),
           br()
    )
    
  )

)
)
