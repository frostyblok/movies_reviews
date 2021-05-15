class AddUniqueIndexToReviews < ActiveRecord::Migration[6.1]
  def change
    add_index :reviews, [:user_id, :movie_id], unique: true
  end
end
