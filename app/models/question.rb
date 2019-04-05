class Question < ApplicationRecord
  belongs_to :poll
  has_many :answers
  has_many :political_party_answers
end
