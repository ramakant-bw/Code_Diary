import os
import shutil

# Folder where your call recording files are located
SOURCE_DIR = r"C:\path\to\your\call_recordings"

for filename in os.listdir(SOURCE_DIR):
    file_path = os.path.join(SOURCE_DIR, filename)

    # Skip directories
    if not os.path.isfile(file_path):
        continue

    # Split filename to extract the number
    # Example: "Call recording +912048402279_260103_175400.wav"
    try:
        name_part = filename.split("_")[0]              # "Call recording +912048402279"
        folder_name = name_part.replace("Call recording ", "").strip()
    except IndexError:
        continue

    # Create folder path
    folder_path = os.path.join(SOURCE_DIR, folder_name)

    # Create folder if it doesn't exist
    os.makedirs(folder_path, exist_ok=True)

    # Move file into the folder
    shutil.move(file_path, os.path.join(folder_path, filename))

print("Files organized successfully.")
