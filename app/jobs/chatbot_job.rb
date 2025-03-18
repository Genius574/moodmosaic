class ChatbotJob < ApplicationJob
  queue_as :default

  def perform(question)
    @question = question

    chatgpt_response = client.chat(
      parameters: {
        model: "gpt-4o-mini",
        messages: questions_with_mood_context # Pass formatted messages
      }
    )

    new_content = chatgpt_response["choices"][0]["message"]["content"]

    question.update(ai_answer: new_content)
    Turbo::StreamsChannel.broadcast_update_to(
      "question_#{@question.id}",
      target: "question_#{@question.id}",
      partial: "questions/question", locals: { question: question }
    )
  end

  private

  def client
    @client ||= OpenAI::Client.new
  end

  def questions_with_mood_context
    recent_moods = @question.user.mood_logs.order(created_at: :desc).limit(3).pluck(:mood)
    mood_summary = if recent_moods.any?
                     "The user has recently felt: #{recent_moods.join(', ')}. Respond accordingly."
                   else
                     "No recent mood logs available. Respond neutrally."
                   end

    questions = @question.user.questions.last(5) # Keep last 5 Q&A for context

    results = [{ role: "system", content: "You are a kind and empathetic therapist. #{mood_summary}" }]

    questions.each do |question|
      results << { role: "user", content: question.user_question }
      results << { role: "assistant", content: question.ai_answer || "..." }
    end

    results
  end
end
