require_relative '../views/customer_view'
require_relative '../models/customer'

class CustomersController

  def initialize(customer_repo)
    @customer_repository = customer_repo
    @view = CustomerView.new
  end
  
  def list
    @view.display_list(@customer_repository.all)
  end

  def add
    # ask the user for the name
    name =  @view.display('name')
    # ask the user for the address
    address =  @view.display('address')
    # create a new instance of Meal
    customer = Customer.new(name: name, address: address)
    # store the instance in the Repository
    @customer_repository.create(customer)
  end
end