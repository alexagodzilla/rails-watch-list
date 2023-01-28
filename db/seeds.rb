# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require "json"
require "open-uri"

Movie.destroy_all

# puts "seeding"
# 6.times do
#   @movie = Movie.create(
#     title: Faker::Movie.title,
#     overview: Faker::Movie.quote ,
#     poster_url: Faker::Movies::Departed.character,
#     rating: rand(1..5)
#   )
# end
# puts "seeded"

"Alleloooyah"

url = "http://tmdb.lewagon.com/movie/top_rated"
  film_serialized = URI.open(url).read
  film = JSON.parse(film_serialized)

  film["results"].each do |result|
  @movie = Movie.create(
      title: result["original_title"],
      overview: result["overview"] ,
      poster_url: "https://image.tmdb.org/t/p/w500#{result["backdrop_path"]}",
      rating: result["vote_average"]
    )
end
