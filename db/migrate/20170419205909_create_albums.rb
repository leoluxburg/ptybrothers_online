class CreateAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :albums do |t|
      t.references :rider, foreign_key: true
      t.string :title
      t.string :photographer
      t.string :location

      t.timestamps
    end
  end
end
