# Pizza Ordering Bot

library(tidyverse)
library(glue)

order_pizza <- function() {
  
  menus <- c("Pepperoni" = 30,
             "Double Cheese" = 25,
             "Deluxe" = 40,
             "French Fries" = 20,
             "Coca Cola" = 10,
             "Water" = 5)
  
  print("Welcome to La Rebanada! What is your name?")
  name <- readline("What is your name?: ")
  
  print(paste("Good day,", name, ". What would you like to order?"))
  
  cat("Choose your menus by typing number\n",
      "1:", names(menus)[1], "- USD 30\n",
      "2:", names(menus)[2], "- USD 25\n",
      "3:", names(menus)[3], "- USD 40\n",
      "4:", names(menus)[4], "- USD 20\n",
      "5:", names(menus)[5], "- USD 20\n",
      "6:", names(menus)[6], "- USD 5\n",
      "If you have finished adding menu, you can type 'done'")
  
  cart <- c()
  
  
  while (T) {
    order_menus <- readline("What would you like to order?: ")
    
    if (order_menus == "done") {
      break
    }
    
    choices <- suppressWarnings(as.numeric(order_menus))
    
    if(!is.na(choices) && choices >= 1 && choices <= length(menus)) {
      cart <- c(cart, choices)
      item_name <- names(menus)[choices]
      print(paste("Add items:", item_name))
    } else {
      print("Invalid menu! Please select available menus.")
    }
  }
  
  if (length(cart) == 0) {
    return("No items ordered. ")
  }
  
  ordered_items <-  names(menus)[cart]
  total_price <-  sum(menus[cart])
  
  print(table(ordered_items, dnn = "Your Order Items"))
  print(glue("Total Price: USD {total_price}"))
  
  payment <- c("Credit/Debit Card", "Cash On Delivery", "PromptPay")
  cat("Choose your payment method:\n",
    "1:", payment[1], "\n",
    "2:", payment[2], "\n",
    "3:", payment[3], "\n")
  
  while(T) {
  
    payment_user <- as.numeric(readline("Select method: "))
    
    if(!is.na(payment_user) && payment_user >= 1 && payment_user <= length(payment)) {
      print(glue("Thank you, {name}. Paid via {payment[payment_user]}. Your food will be ready in 30 minutes!"))
      break
    } else {
      print("Invalid payment method!")
    }
  
  }
}
