class AnswersController < ApplicationController
  def create
    Question.find(answer_params[:question_id])
    user = current_user || User.create!(uuid: user_uuid)
    Answer.create!(answer_params.merge(user: user))
    render status: :created, json: {success: true}
  rescue ActiveRecord::RecordNotFound
    render status: :not_found, json: {error: 'not_found'}
  end

  private

  def answer_params
    params.permit(:question_id, :vote)
  end
end
