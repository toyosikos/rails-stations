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
[
  "Inception",
  "The Shawshank Redemption",
  "The Godfather",
  "Pulp Fiction",
  "The Dark Knight"
].each do |movie_name|
  Movie.find_or_create_by!(name: movie_name, is_showing: true)  # または false
end