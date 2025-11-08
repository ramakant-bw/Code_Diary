from sentence_transformers import SentenceTransformer, util
import torch

# --- 1. Load the Pre-trained Embedding Model ---
# This model converts text into dense, meaningful vectors.
model = SentenceTransformer('all-MiniLM-L6-v2') 

# --- 2. Define the Corpus (Our "Database") ---
# These are the documents/sentences we want to search through.
corpus = [
    "I have a dog and a cat.",
    "The customer service hotline is open 24 hours.",
    "Can you please help me with my account login?",
    "A small kitten is sleeping on the couch.",
    "Where is the nearest ATM machine?",
    "How can I access my profile settings?",
    "Class Arc is having new DA Batch at 8 pm IST "
]

# --- 3. Create the Corpus Embeddings (The Vectors) ---
# The model encodes each sentence into a vector.
# These vectors are what the vector database would store and index.
corpus_embeddings = model.encode(corpus, convert_to_tensor=True)

# --- 4. Define the Query Text ---
query_text = "when is new DA batch"

# --- 5. Create the Query Embedding ---
# The query text must also be converted to a vector using the same model.
query_embedding = model.encode(query_text, convert_to_tensor=True)

# --- 6. Perform Vector Search (Calculate Similarity) ---
# util.cos_sim efficiently calculates the Cosine Similarity between the 
# query vector and all corpus vectors.
# A score closer to 1.0 means higher semantic similarity.
cosine_scores = util.cos_sim(query_embedding, corpus_embeddings)[0]

# --- 7. Find the Best Match ---
# Get the top 2 results
top_k = 2
top_results = torch.topk(cosine_scores, k=top_k)

print(f"Query: **{query_text}**\n")
print(f"Top {top_k} Semantic Search Results:")
print("---------------------------------------")

# Loop through the top results to print the score and the corresponding text
for score, idx in zip(top_results.values, top_results.indices):
    print(f"Score: {score:.4f}")
    print(f"Match: {corpus[idx]}\n")