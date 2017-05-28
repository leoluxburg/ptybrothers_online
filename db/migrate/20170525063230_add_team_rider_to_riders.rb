class AddTeamRiderToRiders < ActiveRecord::Migration[5.0]
  def change
    add_column :riders, :team_rider, :boolean, null: false, default: false
  end
end
