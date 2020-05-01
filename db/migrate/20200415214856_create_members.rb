class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.references :group, foreign_key: true
      t.references :user, foreign_key: true
      t.references :author, foreign_key: false, index: true

      t.timestamps
    end
    add_index :members, [:group_id, :user_id],     unique: true
    add_index :members, [:user_id, :group_id],     unique: true
  end
end
