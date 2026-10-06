class ChatroomController < ApplicationController
  before_action :require_user

  def index
    @messages = Message.includes(:user).recent
    @message  = Message.new
  end
end
