class CreateMen < ActiveRecord::Migration[5.0]
  def change
    create_table :men do |t|
      t.text :name
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :men, [:user_id, :created_at]
  end
end
