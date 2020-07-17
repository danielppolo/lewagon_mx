require_relative "task"
require_relative "tasks_view"

class TasksController
  def initialize(repo)
    @view = TasksView.new
    @repo = repo
  end

  # User action
  def mark_as_done
    # 1. ASK REPO for the tasks
    tasks = @repo.all
    # 2. ASK VIEW to display tasks
    @view.list(tasks)
    # 3. ASK VIEW to ask user for a task to mark
    task_index = @view.ask_for_index
    # 4. ASK task to mark itself as done
    task = @repo.find(task_index)
    task.done!
  end

  def add_task
    # 1. ASK VIEW for task title
    title = @view.ask_for_title
    # 2. ASK TASK for a task instance
    task = Task.new(title)
    # 3. ASK REPO to store it
    @repo.add(task)
  end

  def list_tasks
    # 1. ASK REPO for the tasks
    tasks = @repo.all
    # 2. ASK VIEW to show them
    @view.list(tasks)
  end

  def remove_task
    # 1. ASK REPO for the tasks
    tasks = @repo.all
    # 2. ASK VIEW to display tasks
    @view.list(tasks)
    # 3. ASK VIEW for a number to remove
    task_index = @view.ask_for_index
    # 4. ASK REPO to remove it
    @repo.remove(task_index)
  end
end
