class ChatroomsController < ApplicationController
  def index
    @messages = Message.order(:id)
  end
end
