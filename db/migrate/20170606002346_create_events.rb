class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.time :time
      t.float :inscription
      t.string :location
      t.text :description
      t.references :rider, foreign_key: true

      t.timestamps
    end
  end
end
