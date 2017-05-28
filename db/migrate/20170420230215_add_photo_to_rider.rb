class AddPhotoToRider < ActiveRecord::Migration[5.0]
  def change
    add_column :riders, :photo, :string
  end
end
