class ChangeLongitudeAndLatitudeFromIslands < ActiveRecord::Migration[7.1]
  def change
    change_column :islands, :longitude, :float, using: 'longitude::double precision'
    change_column :islands, :latitute, :float, using: 'latitute::double precision'
  end
end
