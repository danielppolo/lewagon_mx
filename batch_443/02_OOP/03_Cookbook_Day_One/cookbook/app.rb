require_relative "lib/cookbook"
require_relative "lib/controller"
require_relative "lib/router"

# SRP => Single Responsability Principle

cookbook = Cookbook.new("lib/recipes.csv")
controller = Controller.new(cookbook)
router = Router.new(controller)

router.run
