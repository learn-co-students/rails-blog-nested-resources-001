class CommentsController < ApplicationController
  before_action :set_post, only: [:create]

  def create
    @comment = Comment.new(comment_params)
    @comment.update(post: @post)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_post
      @post = Post.find(params[:id])
    end

    # def set_comment
    #   @comment = Comment.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content)
    end
end
