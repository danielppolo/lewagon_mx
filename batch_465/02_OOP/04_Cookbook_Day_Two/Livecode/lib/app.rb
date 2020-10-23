require_relative 'cookbook'    # You need to create this file!
require_relative 'controller'  # You need to create this file!
require_relative 'router'
require_relative 'view'

csv_file   = File.join(__dir__, 'recipes.csv')
cookbook   = Cookbook.new(csv_file) # One source of truth 
view_instance = View.new
controller = Controller.new(cookbook, view_instance)

router = Router.new(controller)

# Start the app
router.run
