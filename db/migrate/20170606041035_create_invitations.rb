class CreateInvitations < ActiveRecord::Migration[5.0]
  def change
    create_table :invitations do |t|
      t.references :rider, foreign_key: true
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
