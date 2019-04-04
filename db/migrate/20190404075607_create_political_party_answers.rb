class CreatePoliticalPartyAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :political_party_answers do |t|
      t.string :vote, null: false
      t.references :question, foreign_key: true
      t.references :political_party, foreign_key: true

      t.timestamps null: false
    end
  end
end
