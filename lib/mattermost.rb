class Mattermost
  class << self
    def send(msg)
      self.new.send(msg)
    end
  end

  def webhook_url
    if Rails.env.production?
      # crowdfunding-live
      'https://brandnewchat.ungleich.ch/hooks/91ijru7fitdc7mqpyhz9zgra3o'
    else
      # crowdfunding-test
      'https://brandnewchat.ungleich.ch/hooks/ojd1d4ek838s7j8ps4r3s9wzqh'
    end
  end

  def send(msg = nil)
    return if msg.nil?
    message = { text: msg }
    `curl -i -X POST -d 'payload=#{JSON.unparse(message)}' #{webhook_url}`
  end
end
