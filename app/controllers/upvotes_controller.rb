class UpvotesController < ApplicationController
  def vote
    @idea = Idea.find(params[:ideas_id])
    upvote = @idea.upvotes.find_by(user: current_user)
    if upvote # turn an existing upvote into a not upvote at all
      upvote.destroy
    else
      @idea.upvotes.create(user: current_user)
    end
  end
end
