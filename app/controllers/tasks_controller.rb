class TasksController < ActionController::Base
  def index
    @most_recent_task = TaskList.last
    @most_recent_task.update!(times_displayed: @most_recent_task.times_displayed + 1) if !Rails.env.development?

    Rails.logger.info(params.keys)
    Rails.logger.info(params.values)
    render "discord_task_template.txt.erb", content_type: "text/plain"
  end
end