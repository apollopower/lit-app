class ConversationsController < ApplicationController
  def index
    @conversations = Conversation.all
  end

  def show

  end

  def create
    @conversation = Conversation.new(verify: false)
    if @conversation.save
      redirect_to root_path

    end
  end

end
