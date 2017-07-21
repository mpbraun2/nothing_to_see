class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :amount
      t.references :user, foreign_key: true
      t.integer :from_user_id
      t.integer :to_user_id

      t.timestamps
    end
  end
end
