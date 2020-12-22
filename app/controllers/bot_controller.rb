class BotController < ApplicationController
  def listen
    render json: { challenge: params[:challenge] }
    return unless params[:event]

    match = (params[:event][:text]).match(/^(\d+)\s*\+\s*(\d+)$/)
    user_token = SlackUserToken.find_by(user_id: params[:team_id])
    if match && params[:event][:type] == 'message'
      Services::SlackApiService.send_message_as_bot(
        "#{match[1]} + #{match[2]} = #{match[1].to_i + match[2].to_i}",
        params[:event][:channel],
        user_token.access_token
      )
    elsif params[:event][:client_msg_id]
      Services::SlackApiService.send_message_as_bot(
        "Sorry, I didn't understand that. I only add numbers in this format. eg: 5+6 or 6+3",
        params[:event][:channel],
        user_token.access_token
      )
    end
  end
end
