class CommentsController < ApplicationController
  before_filter :load_commentable

  def create
    @comment = @commentable.comments.new(params[:comment])

    if @comment.save
      redirect_to @commentable, notice: 'Comment has been submitted and is awaiting approval.'
    else
      @comments = policy_scope(@commentable.comments)
      instance_variable_set("@#{@resource.singularize}".to_sym, @commentable)
      render template: "#{@resource}/show"
    end
  end

  def update
    @comment = Comment.find(params[:id])
    authorize @comment

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @commentable, notice: 'Comment has been submitted and is awaiting approval.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize @comment
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to @commentable, notice: 'comment was deleted.' }
    end
  end

  private

  def load_commentable
    @resource, id = request.path.split('/')[1, 2]
    @commentable = @resource.singularize.classify.constantize.find(id)
  end
end

