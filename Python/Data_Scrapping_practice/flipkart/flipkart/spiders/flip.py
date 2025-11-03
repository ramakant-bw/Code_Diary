import scrapy

from flipkart.items import FlipkartItem
from scrapy_playwright.page import PageMethod
from scrapy.loader import ItemLoader
class FlipSpider(scrapy.Spider):
    name = "flip"
    allowed_domains = ["www.flipkart.com"]
    start_urls = ["https://www.flipkart.com"]

    async def start(self):
        
        yield scrapy.Request(
            url=self.start_urls[0],
            meta=dict(
                playwright=True,
                # Crucial: Include the raw Playwright Page object in the response meta
                playwright_include_page=True,
                # Optional: Pre-action to ensure the content is loaded before screenshot
                playwright_page_methods=[
                    PageMethod('wait_for_selector', 'input.Pke_EE'),
                    PageMethod('screenshot', path='flip.png'),
                    PageMethod('fill', 'input.Pke_EE', 'laptop'),
                    PageMethod('press', 'button._2iLD__', 'Enter'),
                    PageMethod('wait_for_timeout', 2000),
                    PageMethod('screenshot', path='flip_laptop.png', full_page=True)


                ],
                errback=self.errback,
            )
        )

    # async def start(self): 
    #     # Your logic for generating the first request
    #     yield scrapy.Request(
    #         url=self.start_urls[0],
    #         meta={'playwright': True, 'playwright_include_page': True}
    #     )
    def parse(self, response):
        # Using Scrapy's Item Loaders or Items is a good practice for structured data.
        laptop = response.css('div.tUxRFH')
        for lp in laptop:
            loader = ItemLoader(item=FlipkartItem(), selector=lp)
            loader.add_css('title', 'div.KzDlHZ')
            loader.add_css('rating', 'div.XQDdHH')
            loader.add_css('price', 'div._4b5DiR')
          
            yield loader.load_item()


    async def errback(self, failure):
        # Gracefully handle errors and ensure the page is closed
        page = failure.request.meta.get("playwright_page")
        if page:
            await page.close()
        self.log(f'❌ Request failed for {failure.request.url}')