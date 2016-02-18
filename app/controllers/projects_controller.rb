class ProjectsController < ApplicationController
  before_action :find_project, only: [:edit, :show, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]  #if not signed in it will not allow us to create projects
  
  def index
    @projects = Project.created_descending.paginate(page: params[:page], per_page: 2)
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
    if @project.update(project_params)
      redirect_to project_path(@project), notice: "Success"
    else
      render :edit
    end
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
