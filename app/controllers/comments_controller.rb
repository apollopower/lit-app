class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @idea = Idea.find(params[:idea_id])
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to idea_path(@idea) }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def sorting_comments
    @idea = Idea.find(params[:idea_id])
    if params['sort']== 'problem_addressed'
      @comments = @idea.comments.problem_addressed
    elsif params['sort']== 'enhance_idea'
      @comments = @idea.comments.enhance_idea
    elsif params[:sort]== 'implementation'
      @comments = @idea.comments.implementing_idea
    elsif params[:sort]=='all'
      @comments = @idea.comments.order('created_at DESC')
    elsif params[:sort]== 'disagree'
      @comments = @idea.comments.disagree
    else params[:sort]== 'other'
      @comments = @idea.comments.other
    end

    respond_to do |format|
      format.html{ render partial: "comment_sort" }
    end
  end

  def sort_by_problem_addressed
    @idea = Idea.find(params[:idea_id])
    @comments = Comment.problem_addressed
    render template: "ideas/#{@idea.id}"
  end

  def sort_by_enhancement
    @idea = Idea.find(params[:idea_id])
    @comments= Comment.enhance_idea
    render template: '/ideas/:id'
  end

  def sort_by_implementation
    @idea = Idea.find(params[:idea_id])
    @comments= Comment.implementing_idea
    render template: '/ideas/:id'
  end

  def sort_by_disagree
    @idea = Idea.find(params[:idea_id])
    @comments= Comment.disagree
    render template: '/ideas/:id'
  end

  def sort_by_other
    @idea = Idea.find(params[:idea_id])
    @comments= Comment.other
    render template: '/ideas/:id'
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body, :user_id, :idea_id, :topic)
    end

end
