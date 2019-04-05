class QuestionsController < ApplicationController
  def index
    poll = Poll.find(params[:poll_id])
    render json: poll.questions
  end
end
