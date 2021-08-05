require 'open-uri'
require 'json'

Movie.destroy_all

url = 'http://tmdb.lewagon.com/movie/top_rated'

puts "Creating movies"
10.times do |i|
  movies = JSON.parse(open("#{url}?page=#{i+1}").read)['results']
  movies.each do |movie|
    base_poster_url = "https://image.tmdb.org/t/p/original"
    Movie.create(
      title: movie['title'],
      overview: movie['overview'],
      poster_url: "#{base_poster_url}#{['backdrop_path']}",
      rating: movie['vote_average']
    )
  end
end
puts "Finished"