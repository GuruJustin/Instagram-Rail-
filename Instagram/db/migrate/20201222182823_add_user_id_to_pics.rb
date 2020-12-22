class AddUserIdToPics < ActiveRecord::Migration[6.1]
  def change
    add_column :pics, :user_id, :integer
    add_index :pics, :user_id
  end
end