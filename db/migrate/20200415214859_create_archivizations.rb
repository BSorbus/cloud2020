class CreateArchivizations < ActiveRecord::Migration[5.2]
  def change
    create_table :archivizations do |t|
      t.references :archive, foreign_key: true, index: true
      t.references :group, foreign_key: true, index: true
      t.references :archivization_type, foreign_key: true, index: true

      t.timestamps      
    end
    
    add_index :archivizations, [:archive_id, :group_id, :archivization_type_id], unique: true, name: "archivizations_archive_id_group_id_archivization_type_id_idx"
  end
end
