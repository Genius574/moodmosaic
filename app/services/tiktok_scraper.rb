# require 'selenium-webdriver'
# class TiktokScraper
#   def initialize(category_name)
#     @category_name = category_name.downcase
#     @tiktok_url = "https://www.tiktok.com/tag/#{@category_name}"
#   end

#   def fetch_video_links
#     options = Selenium::WebDriver::Chrome::Options.new
#     options.add_argument('--headless') # Run in headless mode
#     options.add_argument('--disable-gpu')
#     options.add_argument('--window-size=1280,800')
#     options.add_argument('--no-sandbox')

#     driver = Selenium::WebDriver.for(:chrome, options: options)
#     driver.navigate.to @tiktok_url

#     sleep(5) # Wait for JavaScript to load

#     video_links = driver.find_elements(css: "a.css-1mdo0pl-AVideoContainer")
#                         .map { |a| a.attribute("href") }

#     driver.quit
#     video_links
#   end
# end
