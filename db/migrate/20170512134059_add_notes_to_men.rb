class AddNotesToMen < ActiveRecord::Migration[5.0]
  def change
    add_column :men, :note, :decimal
  end
end
