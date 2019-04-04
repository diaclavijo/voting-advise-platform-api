require 'test_helper'

class AnswersControllerTest < ActionDispatch::IntegrationTest
  test "POST /answers when question does not exists" do
    assert_no_difference 'Answer.count' do
      post answers_path, params: {question_id: 1}
    end
    assert_response :missing
  end

  test "POST /answers when question exists" do
    assert_difference ['Answer.count', 'User.count'], +1 do
      post answers_path, params: {question_id: questions(:prohibit_cats_run).id, vote: 'yes'}
    end

    assert_response :success
    assert_equal response.parsed_body, {'success' => true}
    answer = Answer.last
    user = User.last
    assert_equal(
      answer.attributes.slice('vote', 'user_id'),
      {
        'vote' => 'yes',
        'user_id' => user.id,
      },
    )

    assert_difference 'Answer.count', +1 do
      assert_no_difference 'User.count' do
        post answers_path, params: {question_id: questions(:prohibit_mice_holes).id, vote: 'yes'}
      end
    end
    answer = Answer.last
    assert_equal(
      answer.attributes.slice('vote', 'user_id'),
      {
        'vote' => 'yes',
        'user_id' => user.id,
      },
    )
  end
end
