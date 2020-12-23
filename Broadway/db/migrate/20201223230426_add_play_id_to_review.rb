class AddPlayIdToReview < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :play_id, :integer
  end
end
