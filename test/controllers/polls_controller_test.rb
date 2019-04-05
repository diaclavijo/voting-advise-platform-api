require 'test_helper'

class ResultsControllerTest < ActionDispatch::IntegrationTest
  test "POST /polls when no user is present" do
    assert_no_difference %w(Question.count PoliticalParty.count PoliticalPartyAnswer.count) do
      post polls_path, params: form_params
      assert_response :not_found
    end
  end

  test "POST /polls" do
    assert_difference -> { Poll.count } => 1,
      ->{ Question.count } => 2,
      ->{ PoliticalParty.count } => 2,
      ->{ PoliticalPartyAnswer.count } => 4 do
      post polls_path, params: form_params.merge(uuid: users(:cat).uuid)
    end

    assert_response :success

    poll = Poll.last
    assert_equal response.parsed_body, {'success' => true, 'pollId' => poll.id}
    assert_equal poll.name, 'First Poll'
    question1 = Question.all[-2]
    question2 = Question.all[-1]
    assert_equal question1.title, 'eat apples?'
    assert_equal question2.title, 'eat oranges?'
    political_party1 = PoliticalParty.all[-2]
    political_party2 = PoliticalParty.all[-1]
    assert_equal political_party1.name, 'apples'
    assert_equal political_party2.name, 'oranges'
    assert_equal question2.political_party_answers.map(&:vote).sort, %w(yes no).sort
  end


  private

  def form_params
    {
      name: 'First Poll',
      questions: [
        {
          title: 'eat apples?',
          body: "",
          political_party_answers: [
            {
              "political_party_name": "apples",
              "vote": "no"
            },
            {
              "political_party_name": "oranges",
              "vote": "yes"
            },
          ]
        },
        {
          title: 'eat oranges?',
          body: "",
          political_party_answers: [
            {
              "political_party_name": "apples",
              "vote": "yes"
            },
            {
              "political_party_name": "oranges",
              "vote": "no"
            },
          ]
        },
      ]
    }
  end
end
