class PollsController < ApplicationController
  def create
    render status: :not_found, json: {} and return if current_user.nil?
    Poll.transaction do
      poll = Poll.new(name: params[:name], user: current_user)
      political_parties = []
      params[:questions].each do |question_params|
        question = poll.questions.build(question_params.permit('title', 'body'))
        question_params[:political_party_answers].each do |pol_answer_param|
          pol_name = pol_answer_param[:political_party_name]
          political_party = begin
            political_parties.find {|p| p.name == pol_name} ||
              PoliticalParty.find_or_initialize_by(name: pol_name)
          end
          political_parties << political_party
          question.political_party_answers.build(
            political_party: political_party,
            vote: pol_answer_param[:vote]
          )
        end
      end
      poll.save!
      render status: :ok, json: {success: true, pollId: poll.id}
    end
  end
end
