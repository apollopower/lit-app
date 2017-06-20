class ConversationsController < ApplicationController
  def index
    @conversations = Conversation.all
  end

  def show

  end

  def new

  end

  def create
    @idea = Idea.find(params[:idea_id])
    @conversation = Conversation.new(author_id: current_user.id, recipient_id: @idea.user.id, idea_id: @idea.id)

    if @conversation.save
      redirect_to root_path
    end
  end

  def update
    @idea = Idea.find(params[:idea_id])
    redirect_to root_path if @conversation.update!(verify: true)
  end

end
