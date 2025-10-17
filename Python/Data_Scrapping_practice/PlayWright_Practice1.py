from playwright.sync_api import sync_playwright

def scrape_data(page):
    books = page.query_selector_all('article.product_pod')


    allData = []

    for book in books:
        title = book.query_selector('h3 a').text_content()
        price = book.query_selector('p.price_color').text_content()

        allData.append({
                'title': title,
                'price': price
            })

    print(allData)


def start_browser(url):
    with sync_playwright() as p:
        browser = p.chromium.launch(headless = False)
        page = browser.new_page()
        page.goto(url)
        page.wait_for_timeout(2000)
        scrape_data(page)



if __name__ =="__main__":
    url = 'https://books.toscrape.com/'
    start_browser(url)