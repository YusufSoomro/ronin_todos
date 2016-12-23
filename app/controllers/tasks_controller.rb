class TasksController < ActionController::Base
  def index
    tasks = Task.current_tasks
    render plain: tasks.map(&:name).join("-")
  end
end