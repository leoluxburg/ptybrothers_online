class AddFotoToPost < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :foto, :string
  end
end
