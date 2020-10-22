require_relative '../models/order.rb'
require_relative '../repositories/meal_repository.rb'
require_relative '../repositories/customer_repository.rb'
require_relative '../repositories/employee_repository.rb'
require 'csv'

class OrderRepository
  def initialize(file_path, meal_repository, customer_repository, employee_repository)
    @file_path = file_path
    @orders = []
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @next_id = 1
    load_csv() if File.exist?(file_path) #Boolean
  end

  def all
    @orders
  end

  def create(order_instance)
    order_instance.id = @next_id
    @orders << order_instance
    @next_id +=1
    save_to_csv
  end

  def find(id)
    return @orders.find { |order| order.id == id}
  end

  def all_undelivered
    return @orders.reject do |order|
      order.delivered? #True || False
    end
    # @orders.select do |order|
    #   !order.delivered? #True || False
    # end
    # @orders.find_all do |order|
    #   order.delivered? == false
    # end
  end

  def my_undelivered(employee)
    return @orders.select do |order|
      (!order.delivered?) and (order.employee.id == employee.id)
    end
  end

  def mark_as_done(order) #Order
    order.deliver! # Ruby change
    save_to_csv # CSV change
  end

  private

  def save_to_csv
    CSV.open(@file_path, 'wb') do |file|
      
      file << %w[id meal_id customer_id employee_id delivered]
      @orders.each do |order| #Order
        file << [order.id, order.meal.id, order.customer.id, order.employee.id, order.delivered?]
      end
    end
  end

  def load_csv
    CSV.foreach(@file_path, { 
        headers: :first_row, 
        header_converters: :symbol 
      }) do |row| #Hash-like
      # id,meal_id,customer_id,employee_id,delivered
      row[:id] = row[:id].to_i
      row[:delivered] = row[:delivered] == "true"
      # Get meal
      meal_id = row[:meal_id].to_i
      row[:meal] = @meal_repository.find(meal_id)
      # Get customer
      customer_id = row[:customer_id].to_i
      row[:customer] = @customer_repository.find(customer_id)
      # Get employee
      employee_id = row[:employee_id].to_i
      row[:employee] = @employee_repository.find(employee_id)
      
      @orders.push(Order.new(row))
      @next_id = row[:id] + 1
    end
  end
  
end
