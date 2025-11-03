import matplotlib.pyplot as plt
import numpy as np

# 1. Prepare Data: Simulate monthly sales data
months = np.array(['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'])
sales = np.array([200, 220, 180, 250, 300, 280])

# 2. Create Containers (Figure and Axes)
# figsize=(width, height) in inches
fig, ax = plt.subplots(figsize=(8, 4)) 

# 3. Plot: Use ax.plot()
ax.plot(months, sales,          # X and Y data
        marker='o',             # Show data points as circles
        linestyle='-',          # Connect points with a solid line
        color='darkblue',       # Line color
        label='Monthly Sales')  # Label for the legend

# 4. Customize: Use ax.set_* methods
ax.set_title('Q1-Q2 Monthly Sales Performance', fontsize=14, fontweight='bold')
ax.set_xlabel('Month', fontsize=12)
ax.set_ylabel('Sales (in thousands)', fontsize=12)
ax.legend(loc='upper left')      # Display the legend
ax.grid(True, linestyle='--', alpha=0.6) # Add a faint grid

# 5. Show
# plt.show()
