require_relative "task_repository"
require_relative "tasks_controller"
require_relative "router"

repo = TaskRepository.new
controller = TasksController.new(repo)
router = Router.new(controller)

router.run
