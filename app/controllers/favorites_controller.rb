class FavoritesController < ApplicationController
  before_action :set_idea

  def index
    user= @current_user
    user.favorite_ideas
  end

  def create
    if Favorite.create(idea: @idea, user: current_user)
      redirect_to @idea, notice: 'Idea has been favorited'
    else
      redirect_to @idea, alert: 'Something went wrong...*sad panda*'
    end
  end

  def destroy
    Favorite.where(idea_id: @idea.id, user_id: current_user.id).first.destroy
    redirect_to @idea, notice: 'Idea is no longer in favorites'
  end

  private

  def set_idea
    @idea = Idea.find(params[:idea_id] || params[:id])
  end
end
