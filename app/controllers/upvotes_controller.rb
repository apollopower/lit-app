class UpvotesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @idea = Idea.find(params[:idea_id])
    user_ideas = current_user.upvotes.find_by(idea_id: params[:idea_id])

    if user_ideas.present?
      user_ideas.destroy
    else
        upvote = @idea.upvotes.build
        upvote.user_id = current_user.id
        upvote.save
      end


    # unless user_ideas.present?
    #   upvote = @idea.upvotes.build
    #   upvote.user_id = current_user.id
    #   upvote.save
    # else
    #   user_ideas.destroy
    # end


    # .find_by(user: current_user)
    # if upvote # unclicking the upvote
    #   upvote.destroy
    # else
    #   @idea.upvotes.create(user: current_user)
    # end
    respond_to do |format|
      format.json { render json: { idea_count: @idea.upvotes.count} }
    end

  end
end
