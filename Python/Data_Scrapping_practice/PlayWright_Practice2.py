from playwright.sync_api import sync_playwright
from bs4 import BeautifulSoup
import pandas as pd
import re


def load_browser(url):
    with sync_playwright() as p:
        browser = p.chromium.launch(headless=False)
        context = browser.new_context()
        page = context.new_page()   
        page.goto(url)
        page.wait_for_timeout(2000)
        page.screenshot(path="page.png")
        book_html = page.inner_html('body')
        return book_html
    

def scrapeData_multi(html_data):
    book_soup = BeautifulSoup(html_data, 'html.parser' )

    articles = book_soup.find_all('article', attrs = {'class':'product_pod'})
    

    print('all articles', len(articles))

    all_book = []

    for book in articles:
        price = book.find('p', attrs={'class':'price_color'}).text
        num_price = float(re.sub(r'[^\d.]', '', price))
        rating = book.find('p', attrs={'class':'star-rating'})['class'][1]
        title = book.find('h3').find('a').attrs['title']
        print(title, price, rating)
        all_book.append({
            'title': title,
            'price': num_price,
            'rating': rating
        })

    return all_book 
    
# def scrapeData_multi_tag(html_data):
#     book_soup = BeautifulSoup(html_data,'html.parser')
#     allP = book_soup.find_all('p',attrs={'class':'star-rating'})
    
#     for pTag in allP:
#         print('pTag',pTag['class'][1])
#         print('-'*10)

#     allTitle = book_soup.find_all('h3')

#     for title in allTitle:
#         print('title',title.find('a').attrs['title'])
#         print('-'*10)




# def scrapeData_single(html_data):
#     book_soup = BeautifulSoup(html_data,'html.parser')
#     print('book_soup.p',book_soup.p['class'][1])
#     print('book_soup.h3',book_soup.h3.a.attrs['title'])



if __name__ == "__main__":
    book_url = 'https://books.toscrape.com/'
    html_data = load_browser(book_url)
    all_book = scrapeData_multi(html_data)
    df = pd.DataFrame(all_book)
    df.to_csv('books.csv',index=False)
    # scrapeData_single(html_data)
    # scrapeData_multi_tag(html_data)



