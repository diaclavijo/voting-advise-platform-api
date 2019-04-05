require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  test "GET /questions" do
    get poll_questions_path(polls(:one).id)
    assert_response :success
    assert_equal(
      response.parsed_body,
      [
        {
          'id' => questions(:prohibit_cats_run).id,
          'title' => "Prohibit cats to run?",
          'body' => ""
        },
        {
          'id' => questions(:prohibit_mice_holes).id,
          'title' => 'Prohibit mice to make holes?',
          'body' => ''
        },
      ]
    )
  end
end
