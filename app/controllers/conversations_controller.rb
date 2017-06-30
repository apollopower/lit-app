class ConversationsController < ApplicationController
  before_action :find_conversation, only: [:show,:update]

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
      ActivityBroadcastJob.perform_later(current_user, @idea, @conversation.id)
      redirect_to root_path
    end
  end

  def update
    if @conversation.update!(verify: true)
      is_verified = true
      ActivityBroadcastJob.perform_later(current_user, @conversation, @conversation.id, is_verified)
      redirect_to idea_conversation_path(@conversation,@conversation)
    else
      render root_path
    end
  end

  private

  def find_conversation
    @conversation = Conversation.find(params[:id])
  end
end
