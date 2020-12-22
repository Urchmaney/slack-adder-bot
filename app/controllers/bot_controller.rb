class BotController < ApplicationController
  def create
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

  def register
    user_token = SlackUserToken.new(Services::SlackApiService.get_bot_user_token(params[:code]))
    if user_token.valid?
      user_token.save
      return render json: { success: true }
    end

    render json: { status: 'error', code: 400, message: 'Issue registering app.' }
  end
end
