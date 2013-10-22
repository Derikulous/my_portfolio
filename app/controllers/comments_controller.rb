class CommentsController < ApplicationController

  def create
    @comment = Comment.new(params[:comment])
      respond_to do |format|
        if @comment.save
          current_user.comments << @comment
          format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        else
          format.html { render action: "new" }
        end
      end
    end
  end
