class CommentsController < ApplicationController
  before_filter :load_commentable

  def index
    @comments = @commentable.comments
  end

  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = Comment.new(params[:comment])
    @post = @comment.post
    @project = @comment.project
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @commentable, notice: 'Comment has been submitted and is awaiting approval.' }
      else
        instance_variable_set("@#{@resource.singularize}".to_sym, @commentable)
        render template: "#{@resource}/show"
      end
    end
  end

  private

  def load_commentable
    resource, id = request.path.split('/')[1, 2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end
end
