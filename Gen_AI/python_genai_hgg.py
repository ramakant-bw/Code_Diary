from transformers import pipeline

# --- 1. Load the Question Answering Pipeline ---
# This line loads the model and tokenizer for the Question Answering task.
# 'distilbert-base-cased-distilled-squad' is a small, fast, and good default model.
qa_pipeline = pipeline("question-answering", model="distilbert-base-cased-distilled-squad")

# --- 2. Define the Context (Your simple object/data) and the Question ---
# The Context is the 'knowledge' the model uses to find the answer.
context = """
The Hugging Face company, based in New York City, was founded in 2016 by Clément Delangue,
Julien Launay, and Thomas Wolf. Their initial product was a chatbot for teenagers.
They are now famous for their open-source libraries like 'transformers' and 'datasets',
which democratize access to powerful Generative AI models.
"""

question = "Who are the founders of the Hugging Face company?"

# --- 3. Get the Answer from the Generative AI Model ---
# The pipeline takes the question and context as input and returns a dictionary (object)
result = qa_pipeline(
    question=question,
    context=context
)

# --- 4. Display the Results ---
print("--- Input Data ---")
print(f"Context: {context.strip()}")
print(f"Question: {question}")
print("-" * 50)

print("--- GenAI Model Answer (Object Output) ---")
# The output is a Python dictionary (object) containing the answer, score, and position.
print(result)

print("\n--- Extracted Answer ---")
# Extracting the simple string answer (the array/value within the object)
print(f"Answer: **{result['answer']}**")
print(f"Confidence Score: {result['score']:.4f}")
print(f"Start Index: {result['start']}, End Index: {result['end']}")
print("-" * 50)


# # Install the Hugging Face Transformers library
# pip install transformers

# # Install PyTorch (required backend)
# # You might need a specific command for your OS/GPU, but this is the general CPU one
# pip install torch