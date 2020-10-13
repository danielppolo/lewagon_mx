require 'open-uri'
require 'nokogiri'

def fetch_movies_url
  # 1. Get the HTML open()
  # 2. Convert it into String .read()
  movies = []
  html_string = open('https://www.imdb.com/chart/top').read
  # 3. Nokigiri::HMTL
  # 4. Search for the element.  `.titleColumn a`
  html_doc = Nokogiri::HTML(html_string)
  html_doc.search('.titleColumn a').each do |link|
    movies.push("http://www.imdb.com#{link.attribute('href').value}")
  end
  movies.first(5)
end

def scrape_movie(url)
  html_string = open(url, {
    'Accept-language' => 'en'
  }).read
  # 3. Nokigiri::HMTL
  # 4. Search for the element.  `.titleColumn a`
  html_doc = Nokogiri::HTML(html_string)
  header = html_doc.search('.title_wrapper h1').text.strip
  match = header.match(/^(?<title>[\w\s:]*)\W\((?<year>\d+)\)$/)
  title = match[:title]
  year = match[:year].to_i
  summary_items = html_doc.search('.credit_summary_item') # Array
  director = summary_items.first.search('a').text.strip
  cast = summary_items.last.search('a').map {|anchor| anchor.text.strip}
  cast.pop
  storyline = html_doc.search('.summary_text').text.strip
  return {
    cast: cast,
    director: director,
    storyline: storyline,
    title: title,
    year: year,
  }
end

# puts fetch_movies_url()
scrape_movie("http://www.imdb.com/title/tt0468569/")

# 1. For each element in the array
# 2. Search for the information. Title, year, cast, storyline, director
# 3. Store movies into an Array
# 4. Write YML file.
# => Array of 5 movies.
# [
#   {
#   cast: [String]
#   director: String
#   storyline: String
#   title: String
#   year: Integer
# },
# ]