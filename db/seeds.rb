# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# [
#   "Inception" ,
#   "The Shawshank Redemption" ,
#   "The Godfather" ,
#   "Pulp Fiction" ,
#   "The Dark Knight" 
# ].each do |movie|
#     Movie.find_or_create_by!(name: movie[:name])
#   end



# db/seeds.rb
sheets = [
  [1, 1, 'a'], [2, 2, 'a'], [3, 3, 'a'], [4, 4, 'a'], [5, 5, 'a'],
  [6, 1, 'b'], [7, 2, 'b'], [8, 3, 'b'], [9, 4, 'b'], [10, 5, 'b'],
  [11, 1, 'c'], [12, 2, 'c'], [13, 3, 'c'], [14, 4, 'c'], [15, 5, 'c']
]

sheets.each do |sheet|
  Sheet.create!(
    id: sheet[0],
    column: sheet[1],
    row: sheet[2]
  )
end