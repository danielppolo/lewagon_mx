require 'csv'
require_relative '../models/customer'

class CustomerRepository
  def initialize(csv_file)
    @csv_file  = csv_file
    @customers = []
    @next_id   = 1

    load_csv if File.exist?(@csv_file)
  end

  def all
    @customers
  end

  def create(customer)
    # add the id to the customer
    customer.id = @next_id
    # add the customer to the @customers array
    @customers << customer
    # add the customer to the csv
    @next_id += 1

    save_csv
  end

  def find(id)
    @customers.find { |customer| customer.id == id }
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }

    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id] = row[:id].to_i # Convert column to Integer

      @customers << Customer.new(row)

      @next_id += 1
    end
  end

  def save_csv
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }

    CSV.open(@csv_file, 'wb', csv_options) do |csv|
      csv << ['id', 'name', 'address']

      @customers.each do |customer|
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end
end

# customer_repo = CustomerRepository.new('customers_test.csv')

# pizza = Customer.new(name: 'pizza', price: 1)

# customer_repo.create(pizza)

# p customer_repo
