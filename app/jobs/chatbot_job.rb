class ChatbotJob < ApplicationJob
  queue_as :default

  def perform(question)
    @question = question
    response = fetch_ai_response
    @question.update(ai_answer: response)

    # Turbo Streams: Update UI in real time
    Turbo::StreamsChannel.broadcast_update_to(
      "question_#{@question.id}",
      target: "question_#{@question.id}",
      partial: "questions/question",
      locals: { question: @question }
    )
  end

  private

  def fetch_ai_response
    client = OpenAI::Client.new
    messages = format_messages_for_openai

    chatgpt_response = client.chat(
      parameters: {
        model: "gpt-4o-mini",
        messages: messages
      }
    )

    chatgpt_response["choices"][0]["message"]["content"]
  end

  def format_messages_for_openai
    # Fetch the last few user moods
    recent_moods = @question.user.moods.order(created_at: :desc).limit(3).pluck(:feeling)
    mood_context = recent_moods.any? ? "The user has recently felt: #{recent_moods.join(', ')}." : "No recent mood logs available."

    # Structure messages for OpenAI
    messages = [
      { role: "system", content: "You are a compassionate therapist trained in mindfulness and emotional well-being. #{mood_context} Tailor your response accordingly." }
    ]

    @question.user.questions.last(5).each do |q|
      messages << { role: "user", content: q.user_question }
      messages << { role: "assistant", content: q.ai_answer || "..." }
    end

    messages
  end
end
