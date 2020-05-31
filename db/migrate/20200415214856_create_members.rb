class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.references :group, foreign_key: true, index: true
      t.references :user, foreign_key: true, index: true
      t.references :author, foreign_key: false, index: true
#      t.references :author, foreign_key: { to_table: :users }, index: true

      t.timestamps
    end
    add_index :members, [:group_id, :user_id], unique: true
  end
end
