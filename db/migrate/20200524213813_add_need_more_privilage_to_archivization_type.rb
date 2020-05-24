class AddNeedMorePrivilageToArchivizationType < ActiveRecord::Migration[5.2]
  def change
    add_column :archivization_types, :need_more_privilage, :boolean, default: false
  end
end
