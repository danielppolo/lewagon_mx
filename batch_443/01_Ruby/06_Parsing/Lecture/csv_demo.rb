require 'csv'

# TODO - let's read/write data from beers.csv
filepath    = 'data/beers.csv'
beers = []

CSV.foreach(filepath, {headers: :first_row}) do |record|
  beers << { name: record['Name'], origin: record['Origin'], appearance: record['Appearance']} 
end

new_beer = { name: 'Sol', appearance: 'blonde', origin: 'Mexico'}
beers << new_beer

CSV.open(filepath, 'wb', { col_sep: ',', force_quotes: true, quote_char: '"' }) do |csv|
  # First line for headers (once)
  csv << ['Name', 'Appearance', 'Origin']
  beers.each do |beer|
    csv << [beer[:name], beer[:appearance], beer[:origin]]
  end
  # csv << ['Sol', 'Blonde', 'Mexico']  
end