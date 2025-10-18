from playwright.sync_api import sync_playwright


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
        page.wait_for_load_state('networkidle')
        page.wait_for_load_state('load')
        page.wait_for_load_state('domcontentloaded')
        



        laptop_titles = page.query_selector_all('div.KzDlHZ')

        for title in laptop_titles:
            print('title',title.text_content())
            print('-'*10)


if __name__ == '__main__':
    flip_url = 'https://www.flipkart.com/'
    load_browser(flip_url)