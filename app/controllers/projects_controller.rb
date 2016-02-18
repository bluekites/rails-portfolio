class ProjectsController < ApplicationController
  before_action :find_project, only: [:edit, :show, :update, :destroy]
  
  def index
    @projects = Project.all.order("created_at desc")
  end
  
  def new
    @project = Project.new
  end
  
  def create
    @project = Project.create(project_params)
    if @project.save
      redirect_to project_path(@project), notice: "Success"
    else
      render :new
    end
  end 
  
  def show
  end
  
  def edit
  end
  
  def update
  
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end
  
  private
    def project_params
      params.require(:project).permit(:title, :description, :link, :slug)
    end
    
    def find_project
      @project = Project.friendly.find(params[:id])
    end
end
