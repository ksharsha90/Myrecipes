class AddRowdieIdToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :rowdie_id, :integer
  end
end
