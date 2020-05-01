class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles do |t|
      t.string :name
      t.string :activities, array: true, using: 'gin', default: '{}'
      t.text :note, default: ""
#      t.references :author, foreign_key: { to_table: :users }, index: true
      t.references :author, foreign_key: false, index: true

      t.timestamps
    end
  end
end
