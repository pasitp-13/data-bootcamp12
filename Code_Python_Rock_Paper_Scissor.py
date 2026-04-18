import random

def start_game():
  hands = ['rock', 'paper', 'scissor']
  user_score = 0
  comp_score = 0

  print("welcome to rock, paper, scissor! Who got 5 scores first = Win!")
  print("Type 'exit' to quit.")

  while (user_score < 5) and (comp_score < 5):
    user_hand = input("Choose your hand (rock, paper, scissor): ")

    if user_hand == "exit":
      print("Exiting...")
      break

    if user_hand not in hands:
      print("Invalid choice, try again")
      continue
    
    comp_hand = random.choice(hands)
    print(f"Computer chose '{comp_hand}'.")

    if user_hand == comp_hand:
      print("Tied, no player gets score!")
    elif (user_hand == "rock") and (comp_hand == "scissor"):
      user_score = user_score + 1
      print(f"You win! Your score is {user_score}. Computer score is {comp_score}.")
    elif (user_hand == "paper") and (comp_hand == "rock"):
      user_score = user_score + 1
      print(f"You win! Your score is {user_score}. Computer score is {comp_score}.")
    elif (user_hand == "scissor") and (comp_hand == "paper"):
      user_score = user_score + 1
      print(f"You win! Your score is {user_score}. Computer score is {comp_score}.")
    else:
      comp_score = comp_score + 1
      print(f"Computer wins! Your score is {user_score}. Computer score is {comp_score}")

    if user_score == 5:
      print("Congratulation! You win the round!")
    elif comp_score == 5:
      print("Game Over! Computer wins the round!")
      print("Don't give up, you can try again!")
      
start_game()
