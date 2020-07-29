require_relative '../views/customer_view'

class CustomersController
  def initialize(customer_repo)
    @customer_repo = customer_repo
    @customer_view = CustomerView.new
  end

  # CustomersController #add should ask the user for a name and price, then store the new customer
  def add
    # 1. Ask the user for the customer name and store in var
    name = @customer_view.ask_name
    # 2. Ask the user for the customer price and store in var
    address = @customer_view.ask_address
    # 3. Create a new customer instance with those values
    customer = Customer.new(name: name, address: address)
    # 4. Add to repository using #create
    @customer_repo.create(customer)
  end

  #   2) CustomersController #list should grab customers from the repo and display them
  def list
    # 1. Ask the repo to bring all customers #all
    customers = @customer_repo.all
    # 2. Pass the customers to the view to display them
    @customer_view.display_all(customers)
  end
end
