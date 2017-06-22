class IdeasController < ApplicationController
  expose(:id) {params[:id]}

  def index
    @ideas = Idea.all
    #following code to display matching recipes in descending order from the time they were created
    @ideas = @ideas.favorited_by(params[:favorited]) if params[:favorited].present?
    if params[:search]
      #   @ideas = Idea.search(params[:search]).joins(:upvotes).group(:id).order("count(*) desc")
      # else
      #   @ideas = Idea.all.joins(:upvotes).group(:id).order("count(*) desc")

     @ideas = Idea.search(params[:search]).order("created_at DESC")
   else
    #  @ideas = Idea.all.order("created_at DESC")
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
    @idea = Idea.find(params[:id])
  end

  def new
    @idea = Idea.new
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def create
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
    params.require(:idea).permit(:title,:summary, :description, :problem, :guidance, :category)
  end

end
