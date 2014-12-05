require 'twilio-ruby'
class UsersController < ApplicationController

    def index
      render :text =>params and return false
    end
    def new
      @user = User.new
    end

    def create
      @user = User.new(params[:user])
      sid = 'AC0dd12d458bb0de56e8af4e4692175b52' 
      token = '0185effde7f4b360fc3a8792b4754d10'
      if @user.save
        render text: "Thank you! You will receive an SMS shortly with verification instructions."

        client = Twilio::REST::Client.new(sid,token)
        client.account.sms.messages.create(
          from: '+12015618808',
          to: @user.phone,
          body: "Hi chetan how are you"
        )
      else
        render :new
      end
    end
end
