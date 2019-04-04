class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.text :body

      t.timestamps null: false
    end
  end
end
