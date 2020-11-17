class CommentsController < ApplicationController
  def new
    @comments = Comment.all 
    @comment = Comment.new
  end

  def create 
    @comment = Comment.new(comment_params)
    if @comment.save
      ActionCable.server.broadcast 'comment_channel', content: @comment
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text)
  end
end
