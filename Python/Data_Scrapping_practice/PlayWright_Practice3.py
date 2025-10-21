from playwright.sync_api import sync_playwright
from bs4 import BeautifulSoup
import pandas as pd
import re
from urllib.parse import urljoin


def scrape_books_multi(start_url, max_pages=None, headless=False):
    """Scrape multiple pages from books.toscrape.com starting at start_url.

    Returns a list of dicts with fields: title, price, rating, availability, product_url, image_url
    """
    all_books = []

    with sync_playwright() as p:
        browser = p.chromium.launch(headless=headless)
        context = browser.new_context()
        page = context.new_page()

        url = start_url
        page_count = 0

        while url:
            page_count += 1
            if max_pages and page_count > max_pages:
                break

            print(f"Loading page {page_count}: {url}")
            page.goto(url)
            page.wait_for_timeout(1200)
            html = page.inner_html('body')

            soup = BeautifulSoup(html, 'html.parser')
            articles = soup.find_all('article', class_='product_pod')
            print(f"  found {len(articles)} items")

            for article in articles:
                try:
                    title = article.h3.a['title'].strip()
                except Exception:
                    title = None

                try:
                    price_text = article.find('p', class_='price_color').text
                    price = float(re.sub(r'[^\d.]', '', price_text))
                except Exception:
                    price = None

                try:
                    rating_class = article.find('p', class_='star-rating')['class']
                    rating = rating_class[1]
                except Exception:
                    rating = None

                try:
                    availability = article.find('p', class_='instock availability').text.strip()
                except Exception:
                    availability = None

                try:
                    rel_link = article.h3.a['href']
                    product_url = urljoin(url, rel_link)
                except Exception:
                    product_url = None

                try:
                    img_src = article.find('img')['src']
                    image_url = urljoin(url, img_src)
                except Exception:
                    image_url = None

                all_books.append({
                    'title': title,
                    'price': price,
                    'rating': rating,
                    'availability': availability,
                    'product_url': product_url,
                    'image_url': image_url,
                })

            # find next page link
            next_li = soup.select_one('li.next a')
            if next_li and next_li.get('href'):
                url = urljoin(url, next_li['href'])
            else:
                url = None

        browser.close()

    return all_books


if __name__ == '__main__':
    start = 'https://books.toscrape.com/'
    # set max_pages=None to follow all pages; set to a small int for testing
    books = scrape_books_multi(start, max_pages=3, headless=False)
    df = pd.DataFrame(books)
    df.to_csv('books_multi.csv', index=False)
    print(f"Saved {len(df)} records to books_multi.csv")
