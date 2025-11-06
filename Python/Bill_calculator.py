print("Bill Calculator")
print("-" * 20)

total = 0
count = 1

while True:
    try:
        # Ask for amount, 'q' to quit
        amount = input(f"Enter amount {count} (or 'q' to finish): ")
        
        # Check if user wants to quit
        if amount.lower() == 'q':
            print("Calculating total...")
            break
            
        # Convert input to float and add to total
        amount = float(amount)
        total += amount
        count += 1
        
    except ValueError:
        print("Please enter a valid number or 'q' to finish")

print("-" * 20)
print(f"Total bill amount: ₹{total:.2f}")