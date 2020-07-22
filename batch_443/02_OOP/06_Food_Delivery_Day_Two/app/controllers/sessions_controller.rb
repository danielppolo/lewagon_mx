require_relative '../views/sessions_view'

class SessionsController
  def initialize(employee_repo)
    @employee_repo = employee_repo
    @sessions_view = SessionsView.new
  end

  def login
    # 1. Ask for username
    username = @sessions_view.ask_for_username
    # 2. Ask for password
    password = @sessions_view.ask_for_password
    # 2.1 Find the employee with those credentials
    employee = @employee_repo.find_by_username(username)
    # 3. If the password is right move on
    return employee if employee && employee.password == password

    # 4. If the password is wrong ask again
    @sessions_view.display_wrong_credentials

    # Recursion
    login
  end
end
