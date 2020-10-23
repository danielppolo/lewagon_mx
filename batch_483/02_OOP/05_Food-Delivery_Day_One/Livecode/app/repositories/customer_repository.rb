require_relative '../models/customer.rb'
require 'csv'

class CustomerRepository
  def initialize(file_path)
    @file_path = file_path
    @customers = []
    @next_id = 1
    load_csv() if File.exist?(file_path) #Boolean
  end

  def all
    @customers
  end

  def create(customer_instance)
    customer_instance.id = @next_id
    @customers << customer_instance
    @next_id +=1
    save_to_csv
  end

  def find(id)
    return @customers.find { |customer| customer.id == id}
  end

  private

  def save_to_csv
    CSV.open(@file_path, 'wb') do |file|
      file << %w[id name address]
      @customers.each do |customer|
        file << [customer.id, customer.name, customer.address]
      end
    end
  end

  def load_csv
    CSV.foreach(@file_path, { 
        headers: :first_row, 
        header_converters: :symbol 
      }) do |row| #Hash-like
      row[:id] = row[:id].to_i
      @customers.push(Customer.new(row))
      @next_id = row[:id] + 1
    end
  end
  
end