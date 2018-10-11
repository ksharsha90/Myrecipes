class AddPasswordDigestToRowdies < ActiveRecord::Migration[5.2]
  def change
     add_column :rowdies, :password_digest, :string
  end
end
