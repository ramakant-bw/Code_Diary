# Define here the models for your scraped items
#
# See documentation in:
# https://docs.scrapy.org/en/latest/topics/items.html

import scrapy
import re
from itemloaders.processors import TakeFirst, MapCompose, Join
# Assuming you import the functions defined above
# from .processors import clean_whitespace, convert_to_float

from w3lib.html import remove_tags # A useful Scrapy utility

def clean_whitespace(value):
    print('price is being in funciton', value)
    print('')
    print('')
    print('')
    print('-'*10)
    """Strips leading/trailing whitespace and replaces newlines/tabs with a space."""
    return value.strip().replace('\n', ' ').replace('\t', ' ')

def convert_to_float(value):
    """Removes the currency symbol and converts the value to a float."""
    # Assuming the value is a string like "€19.99"
    return float(value.replace('₹', '').strip())

def extract_and_convert_price(value):
    """
    Extracts the numeric part from a price string, removes commas, and converts it to a float.
    Handles strings like '₹15,545' or '15,545'.
    """
    # Use regex to find digits and commas, ignoring currency symbols
    match = re.search(r'(\d[\d,.]*)', value)
    if match:
        numeric_string = match.group(1)
        # Remove commas before converting to float
        return float(numeric_string.replace(',', ''))
    return None


# MapCompose is a processor that applies a list of functions sequentially 
# to *each* value it receives.
class FlipkartItem(scrapy.Item):
    # define the fields for your item here like:
    title = scrapy.Field(
        # Input Processor: Cleans up text, removes HTML tags, and strips whitespace
        input_processor=MapCompose(remove_tags, clean_whitespace), 
        # Output Processor: Takes the first (and usually only) value collected
        output_processor=TakeFirst()
    )

    # --- Field 2: Description (combines multiple text elements) ---
    rating = scrapy.Field(
        # Input Processor: Removes tags and cleans whitespace from each extracted piece of text
        input_processor=MapCompose(remove_tags, clean_whitespace),
        # Output Processor: Joins all collected pieces of text into a single string with a space
        output_processor=Join(' ') 
    )

    # --- Field 3: Price (uses custom function for type conversion) ---
    price = scrapy.Field(
        # Input Processor: Cleans text and converts the value from string to float
        input_processor=MapCompose(remove_tags, clean_whitespace, extract_and_convert_price), 
        # Output Processor: Takes the final processed value
        output_processor=TakeFirst()
    )