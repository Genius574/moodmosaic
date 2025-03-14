class MoodsController < ApplicationController
  def new
    @mood = Mood.new
  end

  def create
    @mood = Mood.new(mood_params)
    @mood.user = current_user
    # @mood.category_id = 0
    if @mood.save
      redirect_to edit_mood_path(@mood)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @mood = Mood.find(params[:id])
  end

  def update
    @mood = Mood.find(params[:id])

    if @mood = Mood.update(mood_params)
      redirect_to contents_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @mood = Mood.find(params[:id])

    # Call the TikTokService to get content based on the mood's feeling and category
    @tiktok_videos = TikTokService.new(@mood.feeling).fetch_tiktok_videos(@mood.category.name)

    # You can also add OpenAI content generation if necessary
    client = OpenAI::Client.new
    chatgpt_response = client.chat(parameters: {
      model: "gpt-4o-mini",
      messages: [
        {
          role: "user",
          content: "Generate a blog post based on the mood: #{@mood.feeling} and category: #{@mood.category.name}. Provide the title in plain text without any markdown or special characters, and format the body in normal text. Avoid links to external resources like YouTube, Spotify, or Podcasts."
        }
      ],
      temperature: 0.7
    })
    @content_suggestions = chatgpt_response["choices"][0]["message"]["content"]
  end

  private

  def mood_params
    params.require(:mood).permit(:feeling, :category_id)
  end
end
