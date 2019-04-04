class PoliticalPartyAnswer < ApplicationRecord
  belongs_to :question
  belongs_to :political_party
end
