require 'csv'
require_relative '../models/employee'

class EmployeeRepository
  def initialize(csv_file)
    @csv_file  = csv_file
    @employees = []

    load_csv if File.exist?(@csv_file)
  end

  def all_delivery_guys
    @employees.select { |employee| employee.delivery_guy? }
  end

  # Needed to select employee based on index
  def find(id)
    @employees.find { |employee| employee.id == id }
  end

  # Needed to search for the employee based on username on login
  def find_by_username(username)
    @employees.find { |employee| employee.username == username }
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }

    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id] = row[:id].to_i # Convert column to Integer

      @employees << Employee.new(row)
    end
  end
end
