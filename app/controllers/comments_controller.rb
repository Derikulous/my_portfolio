class CommentsController < ApplicationController
  before_filter :load_commentable

  def create
    @comment = @commentable.comments.new(params[:comment])
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @commentable, notice: 'Comment has been submitted and is awaiting approval.' }
      else
        instance_variable_set("@#{@resource.singularize}".to_sym, @commentable)
        render template: "#{@resource}/show"
      end
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      flash[:notice] = "Comment has been submitted and is awaiting approval."
      redirect_to @comment.post
    else
      flash[:error] = "This comment was not saved. Try again."
      @post = @comment.post
      redirect_to
    end
  end

  private

  def load_commentable
    @resource, id = request.path.split('/')[1, 2]
    @commentable = @resource.singularize.classify.constantize.find(id)
  end
end
