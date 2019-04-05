require 'test_helper'

class ResultsControllerTest < ActionDispatch::IntegrationTest
  test "GET /result" do
    uuid = 'fake-uuid'

    get result_path, params: {uuid: uuid}
    assert_response :success
    assert_equal response.parsed_body, []



    post answers_path, params: {
      question_id: questions(:prohibit_cats_run).id, vote: 'yes', uuid: uuid
    }
    post answers_path, params: {
      question_id: questions(:prohibit_mice_holes).id, vote: 'no', uuid: uuid
    }

    get result_path, params: {uuid: uuid}
    assert_response :success
    assert_equal response.parsed_body, {
      'parties' => [
        {
          'name' => 'mice',
          'score' => 100.00,
          'questions' => [
            {
              'id' => questions(:prohibit_cats_run).id,
              'title' => questions(:prohibit_cats_run).title,
              'user_vote' => 'yes',
              'party_vote' => 'yes',
            },
            {
              'id' => questions(:prohibit_mice_holes).id,
              'title' => questions(:prohibit_mice_holes).title,
              'user_vote' => 'no',
              'party_vote' => 'no',
            },
          ],
        },
        {
          'name' => 'cat',
          'score' => 0.00,
          'questions' => [
            {
              'id' => questions(:prohibit_cats_run).id,
              'title' => questions(:prohibit_cats_run).title,
              'user_vote' => 'yes',
              'party_vote' => 'no',
            },
            {
              'id' => questions(:prohibit_mice_holes).id,
              'title' => questions(:prohibit_mice_holes).title,
              'user_vote' => 'no',
              'party_vote' => 'yes',
            },
          ],
        },
      ]
    }
  end
end
