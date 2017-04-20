class CreateRiders < ActiveRecord::Migration[5.0]
  def change
    create_table :riders do |t|
      t.references :user, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :country
      t.integer :age
      t.text :description
      t.string :user_name

      t.timestamps
    end
  end
end
