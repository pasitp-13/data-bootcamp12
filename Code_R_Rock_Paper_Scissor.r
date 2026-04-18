# Rock, Paper, Scissor

library(tidyverse)


start_game <- function() {
  hands <- c("rock", "paper", "scissor")
  user_score <- 0
  comp_score <- 0
  
  print("welcome to rock, paper, scissor! Who got 5 scores first = Win!")
  print("Type 'exit' to quit.")
  
  while (user_score < 5 & comp_score < 5) {
    user_hand <- readline("Choose your hand (rock, paper, scissor): ")
    
    if(user_hand == "exit") {
      print("Exiting...")
      break
    }
    
    if(!(user_hand %in% hands)) {
      print("Invalid choice, try again")
      next
    }
    
    comp_hand <- sample(hands, 1)
    print(paste("Computer choose:", comp_hand))
    
    if (user_hand == comp_hand) {
      print("Tied, no player gets score!")
    } else if (user_hand == "rock" & comp_hand == "scissor") {
      user_score <- user_score + 1
      print(paste0("You win! Your score is ", user_score, ". Computer score is ", comp_score))
    } else if (user_hand == "paper" & comp_hand == "rock") {
      user_score <- user_score + 1
      print(paste0("You win! Your score is ", user_score, ". Computer score is ", comp_score))
    } else if (user_hand == "scissor" & comp_hand == "paper") {
      user_score <- user_score + 1
      print(paste0("You win! Your score is ", user_score, ". Computer score is ", comp_score))
    } else {
      comp_score <- comp_score + 1
      print(paste0("Computer wins! Your score is ", user_score, ". Computer score is ", comp_score))
    }
    
    if (user_score == 5) {
      print("Congratulations! You win the round!")
    } else if (comp_score == 5) {
      print("Game Over! Computer wins the round!")
      print("Don't give up, you can try again!")
    }
  }
}
