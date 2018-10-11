class AddAdminToRowdies < ActiveRecord::Migration[5.2]
  def change
    add_column :rowdies, :admin, :boolean, default: false
  end
end
