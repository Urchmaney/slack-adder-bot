class AuthController < ApplicationController
  def register
    user_token = SlackUserToken.new(Services::SlackApiService.get_bot_user_token(params[:code]))
    if user_token.valid?
      user_token.save
      return render json: { success: true }
    end

    render json: { status: 'error', code: 400, message: 'Issue registering app.' }
  end
end