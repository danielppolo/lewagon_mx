require_relative '../views/session_view' 
require_relative '../repositories/employee_repository'

class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @session_view = SessionView.new
  end

  def login
    user = nil
    running = true
    while running
      username = @session_view.display('username')
      password = @session_view.get_password
      user = @employee_repository.find_by_username(username)
      if user && (user.password == password)
        @session_view.welcome(user.username)
        running = false
      else
        @session_view.wrong_credentials
      end
    end

    return user
  end

end

