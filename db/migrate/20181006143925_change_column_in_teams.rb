class ChangeColumnInTeams < ActiveRecord::Migration[5.2]
  def change
    rename_column :teams, :email, :description
    change_column :teams, :description, :text
  end
end
