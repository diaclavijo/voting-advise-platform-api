class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string :vote, null: false
      t.references :question, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps null: false
    end
  end
end
