---
title       : Simulating the Monty Hall Problem
subtitle    : Winning a classic game show with the power of statistics...  
framework   : deckjs      # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow  
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---



## The Monty Hall Problem 


Winning a famous game show with the power of statistics... 

Are you ready to win "Let's Make a Deal" over and over again? Are you ready for many, many brand new cars? Are you ready for Monty Hall to be your new best friend? 

Flip through the slides to learn more! Our new application can make all of this possible, or at least help you learn something about a classic problem in statistics.  


---

## A famous game show 

In the game show "Let's Make a Deal", you're given a choice of three doors. Behind one door is a car (vroom, vroom!), but behind the other two doors are goats. You obviously want to choose the door with a car behind it. The game goes like this: 

1. You pick a door, say No. 1. 
2. The host (Monty Hall!), who knows what's behind the doors, opens another door, say No. 3, which has a goat behind it. 
3. He then says to you, "Do you want to pick door No. 2?" 


Is it to your advantage to switch your choice?

--- 

## What's the right answer?

- It initially seems like the correct answer is "no". Why would switching make a difference? Isn't there an equal probability of the car being behind each door?

- It turns out the correct answer is "YES!". Here's the reason why: 
  - There is a 1/3 probability that the car is behind the first door you chose. 
  - There is 2/3 probabily that the car is behind either of the doors you didn't choose, and switching will always choose the right one in this situation. 
  
- Thus: you have a 2/3 chance of winning if you switch doors, but only a 1/3 chance of winning if you stick with your initial choice. 

--- 

## Seeing is believing 


Even with this clear explanation, many people are still skeptical. To convince these skeptics, we wrote a function that repeatedly simulates this game and records the results produced by using each strategy. Let's see some outcomes: 





```r
simulate(100)
```

```
##           Strategy Percentage of Wins
## 1   Naive Strategy                0.4
## 2 Smarter Strategy                0.6
```

```r
simulate(1000)
```

```
##           Strategy Percentage of Wins
## 1   Naive Strategy              0.353
## 2 Smarter Strategy              0.647
```



---

## Try it for yourself!



Still not convinced?! Check out the application at: 

https://blueberryyogurt.shinyapps.io/MontyHall_Simulation

This application allows you to witness what happens as you simulate more and more games! And, you'll get to visualize the results with nice plots that looks something like: 

![plot of chunk unnamed-chunk-3](assets/fig/unnamed-chunk-3-1.png) 
