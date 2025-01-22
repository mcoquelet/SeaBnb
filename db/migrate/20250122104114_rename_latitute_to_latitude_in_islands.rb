class RenameLatituteToLatitudeInIslands < ActiveRecord::Migration[7.1]
  def change
    rename_column :islands, :latitute, :latitude
  end
end
