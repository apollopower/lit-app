class IdeasController < ApplicationController
  before_action :find_idea, only: [:show,:edit,:update,:destroy]

  def index
    @ideas = Idea.all
    if params[:search]
     @ideas = Idea.search(params[:search]).order("created_at DESC")
    else
      @ideas= Idea.sort_by_date
    end
  end

  def sort_by_oldest_first
    @ideas= Idea.sort_by_date("ASC")
    render :template => "ideas/index"
  end

  def upvotesort
     @ideas = Idea.sort_by_upvote
     render :template => "ideas/index"
  end

  def show
    @comment = Comment.new
    @comments = @idea.comments.order('created_at DESC')
  end

  def new
    @idea = Idea.new
  end

  def edit
  end

  def create

    @idea = current_user.ideas.build(idea_params)

    @idea.user_id = current_user.id

    if @idea.save
      redirect_to ideas_path
    else
      render 'new'
    end
  end

  def udpate
    if @idea.update(idea_params)
      redirect_to @idea
    else
      render 'new'
    end
  end

  def destroy
    @idea.destroy
    redirect_to ideas_path
  end


  private

  def idea_params
    params.require(:idea).permit(:title,:summary, :description, :problem, :guidance, :image, :category)
  end

  def find_idea
    @idea = Idea.find(params[:id])
  end

end
