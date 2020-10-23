require_relative '../models/employee.rb'
require 'csv'

class EmployeeRepository
  def initialize(file_path)
    @file_path = file_path
    @employees = []
    @next_id = 1
    load_csv() if File.exist?(file_path) #Boolean
  end

  def all
    @employees
  end

  def find(id)
    @employees.find { |employee| employee.id == id}
  end

  def find_by_username(username)
    @employees.find { |employee| employee.username == username}
  end

  def all_delivery_guys
    @employees.select { |employee| employee.role == 'delivery_guy'}
  end

  private

  def load_csv
    CSV.foreach(@file_path, { 
        headers: :first_row, 
        header_converters: :symbol 
      }) do |row| #Hash-like
      row[:id] = row[:id].to_i
      @employees.push(Employee.new(row))
      @next_id = row[:id] + 1
    end
  end
  
end
