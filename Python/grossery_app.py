import streamlit as st
import pandas as pd

st.set_page_config(page_title="Grocery List Generator", page_icon="🛒")

st.title("🧑‍🍳 Recipe & Grocery List Manager")
st.write("Paste your recipes below, and I'll build a grocery list you can edit!")

# Step 1: Recipe Input Section
recipes_text = st.text_area(
    "Enter recipes (format: ingredient - quantity per line):",
    height=200,
    placeholder="Example:\n2 tomatoes\n1 onion\n200g pasta\n1 tbsp olive oil"
)

# Step 2: Convert Recipes into List
def parse_recipes(text):
    lines = text.splitlines()
    items = []
    for line in lines:
        parts = line.split()
        if len(parts) >= 2:
            qty = parts[0]
            name = " ".join(parts[1:])
            items.append({"Ingredient": name.title(), "Quantity": qty})
    return pd.DataFrame(items)

if st.button("Generate Grocery List"):
    grocery_df = parse_recipes(recipes_text)
    if not grocery_df.empty:
        st.session_state["grocery_list"] = grocery_df
    else:
        st.warning("Please enter a valid recipe list!")

# Step 3: Editable Grocery Table
if "grocery_list" in st.session_state:
    st.subheader("🛍️ Editable Grocery List")
    edited = st.data_editor(
        st.session_state["grocery_list"],
        num_rows="dynamic",
        use_container_width=True
    )
    st.session_state["grocery_list"] = edited

    if st.button("Export to CSV"):
        edited.to_csv("grocery_list.csv", index=False)
        st.success("Grocery list saved to grocery_list.csv!")
