module Services
  module SlackApiService
    SLACK_CHAT_URL = 'https://slack.com/api/chat.postMessage'.freeze

    def self.send_message_as_bot(message, channel)
      RestClient.post(
        SLACK_CHAT_URL,
        { text: message, channel: channel },
        { Authorization: "Bearer #{ENV['SLACK_BOT_TOKEN']}" }
      )
    end
  end
end
