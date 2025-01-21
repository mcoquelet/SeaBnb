class CreateIslands < ActiveRecord::Migration[7.1]
  def change
    create_table :islands do |t|
      t.string :name
      t.text :description
      t.float :average_rating
      t.string :location
      t.string :latitute
      t.string :longitude
      t.float :price
      t.integer :capacity

      t.timestamps
    end
  end
end
