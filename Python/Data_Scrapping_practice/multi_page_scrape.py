from playwright.sync_api import sync_playwright

def wait_func(page):
    page.wait_for_load_state('networkidle')
    page.wait_for_load_state('load')
    page.wait_for_load_state('domcontentloaded')
    page.wait_for_timeout(2000)

def scrape_data(page):
    laptop_titles = page.query_selector_all('div.KzDlHZ')

    for title in laptop_titles:
        print('title',title.text_content())
        print('-'*10)


def load_browser(url):
    with sync_playwright() as p:
        browser = p.chromium.launch(headless= False)
        page = browser.new_page()
        page.goto(url)
        page.wait_for_timeout(2000)
        page.screenshot(full_page=True, path='home.png')
        # need to find input tag and enter value laptop

        search_input = page.query_selector('input.Pke_EE')
        search_input.fill('laptop')
        page.wait_for_timeout(1000)
        search_button = page.query_selector('button._2iLD__')
        search_button.click()
        wait_func(page)
        nextButton = page.query_selector_all('a._9QVEpD')

        nextButton_in_page = True
        while nextButton_in_page:
            if len(nextButton)  > 1:
                nextButton[1].click()
            else:
                nextButton[0].click()

            wait_func(page)
            scrape_data(page)
            if len(page.query_selector_all('a._9QVEpD')) > 0:
                pass
            else:
                nextButton_in_page = False


       

if __name__ == '__main__':
    flip_url = 'https://www.flipkart.com/'
    load_browser(flip_url)



# alternative to if else to find next button

# next_page_button = page.query_selector("a._9QVEpD:has(span:has-text('Next'))")

# if next_page_button:
#     print("Found the 'Next' button directly.")
#     # next_page_button.click()
# else:
#     print("Could not find a button with 'Next' text.")