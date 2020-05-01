class CreateWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :works do |t|
      t.references :trackable, polymorphic: true, index: true
      t.references :author, foreign_key: false, index: true
      t.string :action
      t.text :parameters

      t.timestamps
    end
  end
end
