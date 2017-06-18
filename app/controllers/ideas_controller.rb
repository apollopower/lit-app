class IdeasController < ApplicationController
  def index
    @ideas = Idea.all
  end

  def show
    @idea = Idea.find(params[:id])
  end

  def new
    @idea = Idea.new
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def create
    # @idea = Idea.new(params[:user_id])

    @idea = current_user.ideas.build(idea_params)
    @idea.user_id = current_user.id

    if @idea.save
      redirect_to @idea
    else
      render 'new'
    end
  end

  def udpate
    @idea = Idea.find(params[:id])

    if @idea.update(idea_params)
      redirect_to @idea
    else
      render 'new'
    end
  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy

    redirect_to ideas_path

  end

  private

  def idea_params
    params.require(:idea).permit(:title,:description)
  end

end
