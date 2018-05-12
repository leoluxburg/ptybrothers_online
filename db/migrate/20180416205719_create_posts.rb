class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :fotografo
      t.references :rider, foreign_key: true

      t.timestamps
    end
  end
end
