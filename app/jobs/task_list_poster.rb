class TaskListPoster < ApplicationJob
  queue_as :default

  def perform(nightbot_url, message_slice="")
    uri = URI.parse(nightbot_url)

    header = {'Content-Type': 'text/json'}

    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.request_uri, header)
    request.body = {"message" => "testing"}.to_json

# Send the request
    response = http.request(request)
    Rails.logger.info(response.body)
  end
end