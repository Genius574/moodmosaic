class Content < ApplicationRecord
  belongs_to :category
  belongs_to :mood, optional: true
  enum content_type: %i[spotify youtube blogs quote]

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
end
