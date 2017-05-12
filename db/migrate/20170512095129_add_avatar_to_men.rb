class AddAvatarToMen < ActiveRecord::Migration[5.0]
  def change
    add_column :men, :avatar, :string
  end
end
