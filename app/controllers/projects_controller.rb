class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
  end

  def create
    @project = Project.new(params[:project])

    if @project.save
      flash[:notice] = "Project has been created."
      redirect_to @project
    else
      render 'new'
    end
  end

  def update
    if @project.update_attributes(params[:project])
      flash[:success] = "Successfully updated"
      redirect_to @project
    else
      render 'edit'
    end
  end

  def destroy
    Project.find(params[:id]).destroy
    flash[:success] = "Project deleted."
    redirect_to projects_url
  end

  private

  def project_params
    params.require(:project).permit(:name, :technologies_used)
  end
end
