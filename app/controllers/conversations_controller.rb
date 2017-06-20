class ConversationsController < ApplicationController
  def index
    @conversations = Conversation.all
  end

  def show

  end

  def create
    @idea = Idea.find(params[:id])
    @conversation = Conversation.new(author_id: current_user.id, recipient_id: @idea.user.id, )
    if @conversation.save
      redirect_to root_path
    end
  end

  def update
  end

end
