class CommentsController < ApplicationController

  def create
    @comment = Comment.new(params[:comment])
    @post = @comment.post
      respond_to do |format|
        if @comment.save
          format.html { redirect_to @post, notice: 'Comment has been submitted and is awaiting approval.' }
        else
          @comment = @post.comments
          render 'posts/show'
        end
      end
    end
  end
