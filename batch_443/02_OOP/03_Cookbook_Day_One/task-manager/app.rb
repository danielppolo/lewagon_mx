require_relative "task_repository"
require_relative "tasks_controller"
require_relative "router"

repo = TaskRepository.new
controller = TasksController.new(repo)
router = Router.new(controller)

# Adding tasks on init
walk_the_dog = Task.new("Walk the dog")
repo.add(walk_the_dog)

router.run
