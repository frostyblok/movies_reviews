class AddYearToMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :year, :string
  end
end
