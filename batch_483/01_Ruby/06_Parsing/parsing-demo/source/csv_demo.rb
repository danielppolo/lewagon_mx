require 'csv'

# TODO - let's read/write data from beers.csv
filepath = 'data/beers.csv'
beers = []
csv_options =  {
  headers: :first_row
}

CSV.foreach(filepath, csv_options) do |row|
  beers.push({
    "name" => row["Name"],
    "appearance" => row["Appearance"],
    "origin" => row["Origin"],
    "tasted" => row["Tasted"] == "true"
  })
end

puts beers.inspect
# Modify my data
beers.push({
  "name" => "Sol",
  "appearance" =>  "Blonde",
  "origin" =>  "Mexico"
})

csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
CSV.open(filepath, 'wb', csv_options) do |csv|
  csv << ["Name","Appearance","Origin"]
  beers.each do |beer|
    csv << [beer["name"], beer["appearance"], beer["origin"]]
  end
end

