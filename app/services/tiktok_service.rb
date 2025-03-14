# require 'open-uri'
# require 'nokogiri'


# class TiktokService
#   def initialize(feeling)co
#     @feeling = feeling
#   end

#   def fetch_tiktok_videos(category_name)
#     puts "hello"
#     hashtag = category_name.downcase
#     tiktok_url = "https://www.tiktok.com/tag/#{hashtag}"
#     html = URI.open(tiktok_url)
#     doc = Nokogiri::HTML.parse(html)
#     elements = []
#     doc.search('.css-j4516m-DivVideoFeedV2').each do |element|
#       # href = link['href']
#       # p href
#       elements << element
#     end
#     elements
#   end
# end






# # Replace this with actual logic to fetch videos based on the hashtag
# # [
# #   { id: '1234567890123456789', title: 'Calming Video 1', description: 'A calming video.', embed_url: 'https://www.tiktok.com/embed/7071706301339897094' },
# #   { id: '9876543210987654321', title: 'Calming Video 2', description: 'Another calming video.' }
# # ]
