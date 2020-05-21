class CreateArchivizations < ActiveRecord::Migration[5.2]
  def change
    create_table :archivizations do |t|
      t.references :archive, foreign_key: true, index: true
      t.references :group, foreign_key: true, index: true
      t.references :archivization_type, foreign_key: true, index: true
# 20200517
#      t.references :author, foreign_key: false, index: true
#      t.references :author, foreign_key: { to_table: :users }, index: true

      t.timestamps      
    end
    # add_index :archivizations, [:archive_id, :group_id],     unique: true
    # add_index :archivizations, [:group_id, :archive_id],     unique: true
  end
end
