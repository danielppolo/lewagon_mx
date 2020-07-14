require_relative '../scraper'

describe "#fetch_top_5" do
  it 'should return an array of movies (top 5)' do
    url = 'https://www.imdb.com/chart/top'
    movies = fetch_top_5(url)
    expected_movies = [
      "http://www.imdb.com/title/tt0111161/", # Notice we don't need the query string.
      "http://www.imdb.com/title/tt0068646/",
      "http://www.imdb.com/title/tt0071562/",
      "http://www.imdb.com/title/tt0468569/",
      "http://www.imdb.com/title/tt0050083/"
    ]
    expect(movies).to eq(expected_movies) 
  end
end

describe "#fetch_movie_details" do
  it 'should return a hash with the details' do
    url = "http://www.imdb.com/title/tt0468569/"
    movie = fetch_movie_details(url)
    expected_movie = {
      cast: [ "Christian Bale", "Heath Ledger", "Aaron Eckhart" ],
      director: "Christopher Nolan",
      storyline: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
      title: "The Dark Knight",
      year: 2008
    }
    expect(movie).to eq(expected_movie) 
    
  end
end