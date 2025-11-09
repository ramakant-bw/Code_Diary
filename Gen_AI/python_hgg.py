from datasets import Dataset

# 1. Define the data using a simple object (Python dictionary) structure.
#    The keys represent column names, and the values are Python lists (arrays of data).
data_dict = {
    "id": [1, 2, 3],
    "text": ["Hugging Face is awesome!", "I love deep learning.", "Datasets are powerful."],
    "label": [1, 0, 1]
}

print("--- 1. Initial Python Dictionary (Object with Arrays) ---")
print(data_dict)
print("-" * 50)

# 2. Convert the dictionary into a Hugging Face Dataset object.
#    This is the standard way to load data into the HF ecosystem.
my_dataset = Dataset.from_dict(data_dict)

print("--- 2. Hugging Face Dataset Object ---")
print(my_dataset)
print("-" * 50)

# 3. Access a single 'answer' or row (which is returned as a Python object/dict).
#    This demonstrates accessing a single 'object' example from the dataset.
single_example_index = 1
single_example = my_dataset[single_example_index]

print(f"--- 3. Single Example (Row {single_example_index}) as a Python Object (dict) ---")
print(single_example)
print(f"Type: {type(single_example)}")
print("-" * 50)

# 4. Access a specific column/feature (which is returned as a Python array/list).
#    This demonstrates accessing an 'array' of data across all examples.
text_column = my_dataset["text"]

print("--- 4. Specific Column ('text') as a Python Array (list) ---")
print(text_column)
print(f"Type: {type(text_column)}")
print("-" * 50)

# 5. Access the data within a row as a simple array/value
print("--- 5. Accessing a value (simple array or item) inside the object ---")
print(f"Text for Row {single_example_index}: {single_example['text']}")
print(f"Label for Row {single_example_index}: {single_example['label']}")
print("-" * 50)