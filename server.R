library(shiny)
library(ggplot2)

#simulate one round of the game, returning the results from each strategy
guess <- function(){
  answer <- sample(c("A", "B", "C"), 1)
  first <- sample(c("A", "B", "C"), 1)
  opened <- sample(setdiff(c("A", "B", "C"), c(first, answer)), 1)
  stupid <- first == answer
  smart <- setdiff(c("A", "B", "C"), c(first, opened)) == answer
  return (c(stupid, smart))
}

#simulate the number of games specified by the user
simulate <- function(num){
  totals <- c(0, 0)
  for (i in 1:num){
    totals <- totals + guess()
  }
  results <- data.frame(Strategy = c("Naive Strategy", "Smarter Strategy"), Perc = totals/num, Totals = totals)
  return (results)
}

shinyServer(function(input, output) {
  
  #run simulation based on user input and store the result in a dataframe
  data <- reactive({simulate(input$num)})
  
  #render explanation text to be displayed
  output$text0 <- renderText({"Suppose you're on a game show, and you're given the choice of three doors: Behind
    one door is a car; behind the others, goats. You pick a door, say No. 1, and the host, who 
    knows what's behind the doors, opens another door, say No. 3, which has a goat. He then says 
    to you, 'Do you want to pick door No. 2?' You want to choose the door with a car behind it. 
    Is it to your advantage to switch your choice?
    Your instincts say 'no', but statistics says 'YES!'." })
  
  output$text00 <- renderText({"INSTRUCTIONS: Slide the bar below to choose the number of games you want to play.
                                The application will simulate the number of games you chose and record the outcomes from the two conflicting strategies. 
                                The percentage of times that each strategy resulted in a winning game is plotted, and the
                                number of winning games from each strategy is displayed under this plot. As you play more games, 
                                the percentages of wins from the naive strategy (i.e. answering 'no') should approch 33.33% (shown in red) while the percentage of wins
                                from the smarter strategy (i.e. answering 'YES!') should approach 66.66% (shown in purple)." })
  
  #render text explaining the outcomes
  output$text1 <- renderText({paste("Using your foolish instincts, you won", 
                                   data()$Totals[1], 
                                   "out of",
                                   input$num, 
                                   "games.")})
  output$text2 <- renderText({paste("If you had used the power of statistics, you would have won", 
                                    data()$Totals[2], 
                                    "out of",
                                    input$num, 
  
                                    "games.")})
  
  #render the plot for visualizing the outcomes
  output$Plot <- renderPlot({
    ggplot(data(), aes(x=Strategy, y = Perc)) + geom_bar(stat = "identity") + 
      ylab("Percentage of Wins") + coord_cartesian(ylim = c(0, 1)) + ggtitle("Outcomes from Simulation") + 
      geom_abline(intercept=1/3, slope = 0, color = "#CC6666", size = 1) + 
      geom_abline(intercept=2/3, slope = 0, color = "#9999CC", size = 1)
  })
  
})