# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'json'
require 'open-uri'

url = 'https://tmdb.lewagon.com/movie/top_rated'
user_serialized = URI.open(url).read
movies = JSON.parse(user_serialized)

movies['results'].each do |movie|
  title = movie['title']
  overview = movie['overview']
  rating = movie['vote_average']
  poster_url = "https://image.tmdb.org/t/p/w500#{movie['poster_path']}"
  Movie.create(title: title, overview: overview, rating: rating, poster_url: poster_url)
end
# {"adult":false,"backdrop_path":"/rl7Jw8PjhSIjArOlDNv0JQPL1ZV.jpg","genre_ids":[10749,18],"id":851644,"original_language":"ko","original_title":"20 Century Girl","overview":"Yeon-du asks her best friend Bora to collect all the information she can about Baek Hyun-jin while she is away in the U.S. for heart surgery. Bora decides to get close to Baek's best friend, Pung Woon-ho first. However, Bora's clumsy plan unfolds in an unexpected direction. In 1999, a year before the new century, Bora, who turns seventeen, falls into the fever of first love.","popularity":348.878,"poster_path":"/od22ftNnyag0TTxcnJhlsu3aLoU.jpg","release_date":"2022-10-06","title":"20th Century Girl","video":false,"vote_average":8.8,"vote_count":242}
