class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name
      t.text :note, default: ""
      t.references :author, foreign_key: false, index: true

      t.timestamps
    end
  end
end
