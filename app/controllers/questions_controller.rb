class QuestionsController < ApplicationController
  def index
    @questions = current_user.questions
    @question = Question.new(user_id: current_user.id) # for form

  end

  def create
    @questions = current_user.questions # needed in case of validation error
    @question = current_user.questions.new(question_params)

    if @question.save
      ChatbotJob.perform_later(@question) # Run in background

      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.append(
            "questions",
            partial: "questions/question",
            locals: { question: @question }
          )
        end
        format.html { redirect_to questions_path }
      end
    else
     render :index, status: :unprocessable_entity
    end
  end

  private

  def question_params
    params.require(:question).permit(:user_question)
  end
end
