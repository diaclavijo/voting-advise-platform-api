class ResultsController < ApplicationController
  def show
    render status: :ok, json: [] and return if current_user.nil?
    user_answers = current_user.answers.includes(:question)

    score = Hash.new(0)
    PoliticalParty.all.each do |party|
      user_answers.each do |user_answer|
        party_answer = PoliticalPartyAnswer.find_by(
          political_party_id: party.id,
          question_id: user_answer.question_id,
        )
        vote_integer_map = {
          'no' => -1,
          'neutral' => 0,
          'yes' => 1,
        }
        max_distance = 2
        diff = vote_integer_map[user_answer.vote] -
          vote_integer_map[party_answer.vote]
        score[party.name] += max_distance - diff.abs
      end
    end
    max_possible_score = user_answers.size * 2
    score.transform_values! {|v| (v / max_possible_score.to_f) * 100}

    render status: :ok, json: {
      'parties' => PoliticalParty.all.map do |party|
        {
          'name' => party.name,
          'score' => score[party.name],
          'questions' => user_answers.map do |answer|
            {
              'id' => answer.question_id,
              'title' => answer.question.title,
              'user_vote' => answer.vote,
              'party_vote' =>
                PoliticalPartyAnswer.find_by(
                  political_party_id: party.id,
                  question_id: answer.question_id
                ).vote,
            }
          end
        }
      end.sort_by { |hsh| -1 * hsh['score'] }
    }
  end
end
