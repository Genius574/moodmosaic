require "open-uri"
class Content < ApplicationRecord
  belongs_to :category
  belongs_to :mood, optional: true
  has_one_attached :photo
  enum content_type: %i[spotify blog quote image]

  def blog
    if super.blank?
      set_blog
    else
      super
    end
  end

  def set_blog
    # inside a instance method of the content class
    # we have access to 'self' which is the instance of content this method is called on

    client = OpenAI::Client.new
    chatgpt_response = client.chat(parameters: {
      model: "gpt-4o-mini",
      messages: [
        {
          role: "user",
          content: "Generate a blog post based on the mood: #{mood.feeling || 'fine'} and with the tone: #{category.name}. Provide the title in plain text without any markdown or special characters, and format the body in normal text. Avoid links to external resources like YouTube, Spotify, or Podcasts."
        }
      ],
      temperature: 0.7
    })
    new_blog = chatgpt_response["choices"][0]["message"]["content"]
    update(blog: new_blog, content_type: "blog")
    return new_blog
  end


  def set_photo
    client = OpenAI::Client.new
    response = client.images.generate(parameters: {
      prompt: "An image for a person feeling #{mood.feeling} and wanting an image that is #{mood.category.name}", size: "256x256"
    })

    url = response["data"][0]["url"]
    puts url
    file = URI.parse(url).open
      puts file
    photo.purge if photo.attached?
    photo.attach(io: file, filename: "ai_generated_image.jpg", content_type: "image/png")
    return photo
  end
end
