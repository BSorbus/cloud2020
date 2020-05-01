class CreateApprovals < ActiveRecord::Migration[5.2]
  def change
    create_table :approvals do |t|
      t.references :role, foreign_key: true
      t.references :user, foreign_key: true
      t.references :author, foreign_key: false, index: true

      t.timestamps
    end
    add_index :approvals, [:role_id, :user_id],     unique: true
    add_index :approvals, [:user_id, :role_id],     unique: true
  end
end
