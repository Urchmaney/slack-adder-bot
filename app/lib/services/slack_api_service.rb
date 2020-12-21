module Services
  module SlackApiService
    SLACK_CHAT_URL = 'https://slack.com/api/chat.postMessage'

    def SlackApiService.sendMessageAsBot(message, channel)
      RestClient.post(SLACK_CHAT_URL, 
      { text: message, channel: channel }, { Authorization: "Bearer #{ENV['SLACK_BOT_TOKEN']}" })
    end
  end
end