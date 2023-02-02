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



# url = "http://tmdb.lewagon.com/movie/top_rated"
#   film_serialized = URI.open(url).read
#   film = JSON.parse(film_serialized)

#   film["results"].each do |result|
#   @movie = Movie.create(
#       title: result["original_title"],
#       overview: result["overview"] ,
#       poster_url: "https://image.tmdb.org/t/p/w500#{result["backdrop_path"]}",
#       rating: result["vote_average"]
#     )
# end


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or create!d alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create!(name: "Luke", movie: movies.first)
puts 'destroying database'
Movie.destroy_all
List.destroy_all
puts 'creating database'
json_films = JSON.parse(URI.open('http://tmdb.lewagon.com/movie/top_rated').read)
json_films['results'].each do |film|
  Movie.create!(
    title: film['title'],
    overview: film['overview'],
    poster_url: "https://image.tmdb.org/t/p/w500#{film['backdrop_path']}",
    rating: film['vote_average']
  )
  puts 'seeded'

end
List.destroy_all
List.create!(name:"Classic Movies")
List.create!(name:"Horrors")
List.create!(name:"My Favourite Movies")
List.create!(name:"Night in")

Bookmark.create!(comment:Faker::Marketing.buzzwords ,movie_id:1,list_id:1)
Bookmark.create!(comment:Faker::Marketing.buzzwords,movie_id:3,list_id:1)
Bookmark.create!(comment:Faker::Marketing.buzzwords,movie_id:4,list_id:1)
3.times do
  Review.create!(content:Faker::Movie.quote, rating:rand(6) ,list_id:1 )
  Review.create!(content:Faker::Movie.quote, rating:rand(6) ,list_id:2 )
  Review.create!(content:Faker::Movie.quote, rating:rand(6) ,list_id:3 )
  Review.create!(content:Faker::Movie.quote, rating:rand(6) ,list_id:4 )
end
Bookmark.create!(comment:Faker::Marketing.buzzwords,movie_id:11,list_id:2)
Bookmark.create!(comment:Faker::Marketing.buzzwords,movie_id:9,list_id:2)
Bookmark.create!(comment:Faker::Marketing.buzzwords,movie_id:10,list_id:2)
Bookmark.create!(comment:Faker::Marketing.buzzwords,movie_id:12,list_id:3)
Bookmark.create!(comment:Faker::Marketing.buzzwords,movie_id:13,list_id:3)
Bookmark.create!(comment:Faker::Marketing.buzzwords,movie_id:14,list_id:3)
Bookmark.create!(comment:Faker::Marketing.buzzwords,movie_id:19,list_id:4)
Bookmark.create!(comment:Faker::Marketing.buzzwords,movie_id:18,list_id:4)
Bookmark.create!(comment:Faker::Marketing.buzzwords,movie_id:17,list_id:4)
