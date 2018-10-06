class CreateRowdies < ActiveRecord::Migration[5.2]
  def change
    create_table :rowdies do |t|
      t.string :rowdyname
      t.string :email
      t.timestamps
    end
  end
end
