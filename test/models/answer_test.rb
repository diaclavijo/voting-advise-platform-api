require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  test "vote validations" do
    answer = answers(:one)
    valid_votes = %w(yes no neutral)
    valid_votes.each do |valid_vote|
      answer.vote = valid_vote
      assert answer.valid?
    end
    answer.vote = 'invalid-vote'
    assert_not answer.valid?
  end
end
