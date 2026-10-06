class MessagesController < ApplicationController
  before_action :require_user

  def create
    @message = current_user.messages.build(message_params)
    if @message.save
      head :ok
    else
      redirect_to root_path, alert: @message.errors.full_messages.to_sentence
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
