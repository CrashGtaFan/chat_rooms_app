class ChatroomsController < ApplicationController
  before_action :require_user, only: [:index, :create]

  def index
    @messages = Message.order(:id)
  end
end
