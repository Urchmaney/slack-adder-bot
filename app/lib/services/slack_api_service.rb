module Services
  module SlackApiService
    SLACK_CHAT_URL = 'https://slack.com/api/chat.postMessage'.freeze
    SLACK_AUTH_URL = 'https://slack.com/api/oauth.v2.access'.freeze

    def self.send_message_as_bot(message, channel, token)
      RestClient.post(
        SLACK_CHAT_URL,
        { text: message, channel: channel },
        { Authorization: "Bearer #{token}" }
      )
    end

    def self.get_bot_user_token(code)
      response = RestClient.post(
        SLACK_AUTH_URL,
        { code: code, client_id: ENV['SLACK_CLIENT_ID'], client_secret: ENV['SLACK_CLIENT_SECRET'] }
      )
      body = JSON.parse(response.body).with_indifferent_access
      { user_id: body[:team] ? body[:team][:id] : nil, access_token: body[:access_token] }
    rescue RestClient::ExceptionWithResponse
      { user_id: nil, access_token: nil }
    end
  end
end
