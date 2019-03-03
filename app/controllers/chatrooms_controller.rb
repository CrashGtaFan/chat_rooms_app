class ChatroomsController < ApplicationController
  before_action :require_user, only: [:index]

  def index
    @messages = Message.custom_display
    @message = Message.new
  end
end
