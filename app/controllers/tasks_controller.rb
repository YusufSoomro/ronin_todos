class TasksController < ActionController::Base
  def index
    @most_recent_task_list = TaskList.last
    @first_unfinished_task = @most_recent_task_list.tasks.detect { |task| !task.is_really_done? }

    render "discord_task_template.txt.erb", content_type: "text/plain"
  end

  def all_tasks
    @most_recent_task_list = TaskList.last

    render "all_tasks.txt.erb", content_type: "text/plain"
  end
end