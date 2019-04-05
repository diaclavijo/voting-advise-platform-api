class AddPollReferencesToQuestions < ActiveRecord::Migration[5.2]
  def change
    change_table :questions do |t|
      t.references :poll, foreign_key: true
    end
  end
end
