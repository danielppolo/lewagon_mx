require 'csv'
require_relative 'patient'

file_path = 'data/patients.csv'
csv_options = {
  headers: :first_row,
  header_converters: :symbol
}

patient_list = []

CSV.foreach(file_path, csv_options) do |row|
  row[:id] = row[:id].to_i
  row[:cured] = row[:cured] == "true"
  attributes = {
    id: row[:id],
    cured: row[:cured],
    first_name: row[:first_name],
    last_name: row[:last_name],
    blood_type: row[:blood_type],
  }
  patient_list << Patient.new(attributes)
end


p patient_list