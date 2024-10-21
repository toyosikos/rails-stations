class AddColumnsToMovies < ActiveRecord::Migration[7.1]
  def change
    add_reference :movies, :screen, foreign_key: true
    add_reference :movies, :theater, foreign_key: true
  end
end
