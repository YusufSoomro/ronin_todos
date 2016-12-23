class TasksController < ActionController::Base
  def index
    @most_recent_task = TaskList.last
    @most_recent_task.update!(times_displayed: @most_recent_task.times_displayed + 1) if !Rails.env.development?

    nightbot_url = request.env["HTTP_NIGHTBOT_RESPONSE_URL"]
    nightbot_url[4] = ''

    Rails.logger.info(params.keys)
    Rails.logger.info(params.values)
    Rails.logger.info(request.env.inspect)
    Rails.logger.info(nightbot_url)

    TaskListPoster.perform_later(nightbot_url)
    head :ok
  end
end