class ChatroomsController < ApplicationController
  before_action :require_user, only: [:index]

  def index
    @messages = Message.order(:id)
    @message = Message.new
  end
end
