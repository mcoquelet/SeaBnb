class AddUserIdToIslands < ActiveRecord::Migration[7.1]
  def change
    add_reference :islands, :user, null: false, foreign_key: true
  end
end
