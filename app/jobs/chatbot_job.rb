class ChatbotJob < ApplicationJob
  queue_as :default

  def perform(question)
    return if question.user_question.blank?
    Rails.logger.info "Running ChatbotJob for Question ID: #{question.id}, Content: #{question.user_question}"
    @question = question
    response = fetch_ai_response
    @question.update(ai_answer: response)

    # Turbo Streams: Update UI in real time
    Turbo::StreamsChannel.broadcast_update_to(
      "questions",
      target: "question_#{@question.id}",
      partial: "questions/question",
      locals: { question: @question }
    )
  end

  private

  def fetch_ai_response
    client = OpenAI::Client.new
    messages = format_messages_for_openai

    begin
      chatgpt_response = client.chat(
        parameters: {
          model: "gpt-4o-mini",
          messages: messages
        }
      )

      return chatgpt_response.dig("choices", 0, "message", "content") || "I'm sorry, I couldn't generate a response right now."
    rescue StandardError => e
      Rails.logger.error "Chatbot API Error: #{e.message}"
      return "Oops, something went wrong. Please try again later."
    end
  end

  def format_messages_for_openai
    # Fetch the last few user moods
    recent_moods = @question.user.moods.order(created_at: :desc).limit(3).pluck(:feeling)
    mood_context = recent_moods.any? ? "The user has recently felt: #{recent_moods.join(', ')}." : "No recent mood logs available."

    # Structure messages for OpenAI
    messages = [
      { role: "system", content: "You are a compassionate therapist trained in mindfulness and emotional well-being. #{mood_context} Tailor your response accordingly. Your responses must be less than 200 words always!" }
    ]
    puts messages
    @question.user.questions.last(5).each do |q|
      messages << { role: "user", content: q.user_question }
      messages << { role: "assistant", content: q.ai_answer || "..." }
    end

    messages
  end
end
