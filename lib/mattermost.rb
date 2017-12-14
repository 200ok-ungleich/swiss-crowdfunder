require 'net/http'
require 'uri'

class Mattermost
  class << self
    def send(msg)
      self.new.send(msg)
    end
  end

  def webhook_url
    Settings.mattermost_endpoint
  end

  def send(msg = nil)
    return if msg.nil?
    message = { text: msg }

    # Translate the following curl command to Ruby stdlib HTTP Post
    #`curl -i -X POST -d 'payload=#{JSON.unparse(message)}' #{webhook_url}`

    begin
      uri = URI.parse webhook_url
      request = Net::HTTP::Post.new(uri)
      request.body = "payload=#{JSON.unparse(message)}"

      req_options = {use_ssl: uri.scheme == "https"}

      Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
      end
    rescue => e
      Rails.logger.error("Error sending notification to Mattermost: " + e.message)
    end
  end
end
