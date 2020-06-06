class AddQuotaToArchive < ActiveRecord::Migration[5.2]
  def change
    add_column :archives, :quota, :bigint

    reversible do |dir|
      dir.up   { 

        Archive.all.each do |rec|
          rec.update_columns(quota: 1073741824)
        end

      }
    end

  end
end
