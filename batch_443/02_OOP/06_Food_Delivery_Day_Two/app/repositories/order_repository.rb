
class OrderRepository
  def initialize(csv_file, meal_repository, customer_repository, employee_repository)
    @csv_file            = csv_file
    @meal_repository     = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @next_id       = 1
    @orders        = []

    load_csv if File.exist?(@csv_file)
  end 

  def create(order)
    order.id = @next_id
    @orders << order
    save_csv
    @next_id += 1
  end

  def undelivered_orders
    @orders.reject { |order| order.delivered? }
  end

  def employee_undelivered_orders(employee)
    @orders.select { |order| !order.delivered? && order.employee == employee }
  end

  def save_csv
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }

    CSV.open(@csv_file, 'wb', csv_options) do |csv|
      csv << ['id', 'delivered', 'meal_id','customer_id','employee_id']

      @orders.each do |order|
        csv << [order.id, order.delivered?, order.meal.id, order.customer.id, order.employee.id]
      end
    end
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }

    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id]        = row[:id].to_i             # Convert column to Integer
      row[:meal]      = @meal_repository.find(row[:meal_id].to_i) 
      row[:customer]  = @customer_repository.find(row[:customer_id].to_i)
      row[:employee]  = @employee_repository.find(row[:employee_id].to_i)
      row[:delivered] = row[:delivered] == 'true' 

      @orders << Order.new(row)

      @next_id += 1
    end
  end
end