class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :sid, null: false
      t.integer :age
      t.string :email
      t.string :genre

      t.timestamps null: false
    end
  end
end
