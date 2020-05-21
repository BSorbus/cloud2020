class CreateArchives < ActiveRecord::Migration[5.2]
  def change
    create_table :archives do |t|
      t.uuid :archive_uuid, index: true
      t.string :name
      t.text :note, default: ""
      t.references :author, foreign_key: false, index: true
#      t.references :author, foreign_key: { to_table: :users }, index: true

      t.timestamps
    end
  end
end
