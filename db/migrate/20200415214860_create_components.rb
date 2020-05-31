class CreateComponents < ActiveRecord::Migration[5.2]
  def change
    create_table :components do |t|
      t.uuid :component_uuid
      t.string :component_file
      t.string :file_content_type
      t.string :file_size
      t.string :name, index: true
      t.string :name_if_folder, index: true
      t.bigint :parent_id
      t.text :note, default: ""
      t.references :componentable, polymorphic: true, index: true
      t.references :author, foreign_key: false, index: true
#      t.references :author, foreign_key: { to_table: :users }, index: true

      t.timestamps
    end
  end
end
