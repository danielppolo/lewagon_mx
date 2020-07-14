require 'open-uri'
require 'nokogiri'

def fetch_top_5(url)
    # 1. Open the URL
    html_file = open(url, { 'Accept-Language' => 'en' }).read
    # 2. Parse the HTML into Nokigiri
    html_doc = Nokogiri::HTML(html_file)
    # 3. Search for the movie elements
    # HTML TAG: h1, p, span, div, ...
    # CLASS: .title, .movie-picture
    # ID: #movie-container, #movie-list
    movies = []
    html_doc.search('.titleColumn a').first(5).each do |movie|
      # 4. Get the URL (href) for each movie
      # 5. Push values into an array
      movies << "http://www.imdb.com#{movie.attribute('href').value}"
    end


  # 6. Return the first 5 elements in the array
  return movies
end


def fetch_movie_details(url)
  # Title => .title_wrapper h1
  # Year => #titleYear a
  # Director => .plot_summary credit_summary_item (first) a
  # Cast => .plot_summary credit_summary_item (third) a
  # Storyline => .summary_text
  details = {}

  html_file = open(url , { 'Accept-Language' => 'en' }).read
  html_doc = Nokogiri::HTML(html_file)
  title_wrapper = html_doc.search('.title_wrapper h1').text
  match_title = title_wrapper.match(/(?<title>.+)\((?<year>\d{4})\)/)

  details[:title] = match_title[:title][0..-2]

  details[:year] = match_title[:year].to_i

  details[:director] =  html_doc.search('.plot_summary .credit_summary_item').first().search('a').text
  
   
  cast_elements = html_doc.search('.plot_summary .credit_summary_item')[2].search('a')
  details[:cast] = cast_elements.map do |actor|
    actor.text
  end

  # Delete the `See full cast & crew`
  details[:cast].pop

  details[:storyline] = html_doc.search('.summary_text').text.strip
  
  return details
end
