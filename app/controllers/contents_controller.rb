class ContentsController < ApplicationController
  def index
    @mood = current_user.moods.order(updated_at: :asc).last
    # @contents = Content.where(category_id: @mood.category.id)
    # feeling = params[:feeling]
    # if feeling.present? && FEELING_KEYWORDS[feeling.to_sym].present?
    #   keywords = FEELING_KEYWORDS[feeling.to_sym]
    #   keyword = keyword.sample
    #   photos = Unsplash::Photo.search(keyword,10)
    #   if photos.present?
    #     photos.each do |photo|
    #     image_url = photos.urls['regular']
    #     photographer = photo.user.name
  end

  def show
    @content = Content.find(params[:id])
    category = @content.category.name
    mood = @content.category.name
    client = OpenAI::Client.new
    chatgpt_response = client.chat(parameters: {
      model: "gpt-4o-mini",
      messages: [
        {
          role: "user",
          content: "Generate a blog post based on the mood: #{mood} and category: #{category}. Provide the title in plain text without any markdown or special characters, and format the body in normal text. Avoid links to external resources like YouTube, Spotify, or Podcasts."
        }
      ],
      temperature: 0.7
    })
    @content_suggestions = chatgpt_response["choices"][0]["message"]["content"]
  end
end
