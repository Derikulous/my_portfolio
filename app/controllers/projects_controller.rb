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
end

    # @project = Project.new(params[:project])
    # if @project.save
    #   flash[:notice] = "Project has been created."
    #   redirect_to @project
    # else
    #   redirect_to
    # end
