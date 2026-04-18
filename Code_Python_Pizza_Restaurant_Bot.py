def order_pizza():
  menus = {
      "Pepperoni": 30,
      "Double Cheese": 35,
      "Deluxe": 40,
      "French Fries": 20,
      "Coca Cola": 10,
      "Water": 5
  }

  print("Welcome to La Rebanada! What is your name?")
  name = input("What is your name?: ")

  print(f"Good day, {name}. What would you like to order?")
  print("-----Menus-----")

  for i, item in enumerate(menus, start = 1):
    print(f"{i}: {item}: ${menus[item]}")

  cart = []

  while (True):
    order_menus = input("What would you like to order?: ")

    if order_menus.lower() == "done":
      break
    try:
      choices = int(order_menus)

      if choices > 0 and choices <= len(menus):
        item = list(menus.keys())[choices - 1]
        cart.append(item)
        print(f"> {item} has been added to your cart.")
      else:
        print("Invalid menu! Please select available menus (Choose 1 to 6)")
    except ValueError:
      print("Invalid input! Please enter a number or 'done' to finish ordering")

  if len(cart) == 0:
    print("No items ordered. See you next time!")
    return
  else:
    print("-----Summary of Your Order-----")
    for item in cart:
      print(f"{item}")
      
    total_price = sum(menus[item] for item in cart)
    print(f">> Total price: ${total_price}")
  
  print("-----Payment Methods-----")
  payment = ["Credit/Debit Card", "Cash On Delivery", "PromptPay"]
  for i, item in enumerate(payment, start = 1):
    print(f"{i}: {item}")
  
  while(True):
    try:
      payment_user = int(input("Please enter your payment: ")) - 1
      if (payment_user >= 0) and (payment_user < len(payment)):
        print(f"Thank you, {name}. Paid via {payment[payment_user]}. Your food will be ready in 30 minutes")
        break
      else:
        print("Invalid payment! Please select available payment (Choose 1 to 3)")
    except ValueError:
      print("Invalid input! Please enter a number")
      
order_pizza()
