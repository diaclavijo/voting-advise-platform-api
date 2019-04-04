class Answer < ApplicationRecord
  validates :vote, inclusion: {in: %w(yes no neutral)}
  belongs_to :question
  belongs_to :user
end
