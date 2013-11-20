class ProjectsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @projects = Project.all
    @uploader = Project.new.image
    @uploader.success_action_redirect = new_painting_url
  end

  def new
    @project = Project.new(key: params[:key])
  end

  def show
    @project = Project.find(params[:id])
    @commentable = @project
    @comments = @commentable.comments
    @comment = Comment.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(params[:project])

    if @project.save
      flash[:notice] = "Project has been created"
      redirect_to @project
    else
      flash[:alert] = "Project could not be saved"
      render :new
    end
  end

  def update
    @project = Project.find(params[:id])

    if @project.update_attributes(params[:project])
      redirect_to @project, notice: 'Project was successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to @project, notice: 'Project was successfully deleted'
  end
end
