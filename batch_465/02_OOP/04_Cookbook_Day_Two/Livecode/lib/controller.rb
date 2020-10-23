class Controller
  def initialize(cookbook_param, view) #Cookbook, # View
    @cookbook = cookbook_param
    @view = view
  end

  def list 
    # Display all my recipes
    recipes = @cookbook.all
    @view.list(recipes)
  end


  def create 
    name = @view.ask('name')
    description = @view.ask('description')
    new_recipe = Recipe.new(name, description)
    @cookbook.create(new_recipe)
  end 

  def destroy 
    # List all the recipes
    list
    # Choose a recipe
    index = @view.choose
    # Then destroy
    @cookbook.destroy(index)
  end

end