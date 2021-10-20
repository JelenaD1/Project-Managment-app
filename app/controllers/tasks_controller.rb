require 'pry'
class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project
  before_action :set_task, only: [:show, :edit, :update, :destroy]


  def index
    @tasks = @project.tasks
  end

  def show
  end

  def new
    @task = @project.tasks.build
     @all_categories = Category.all
  end

  def edit
  end

  def create
     @all_categories = Category.all
    @task = @project.tasks.build(task_params)

    if @task.save
      redirect_to @project, notice: "New task was created!"
    else
      render action: 'new'
    end
  end

  def update
    if @task.update_attributes(task_params)
      redirect_to(@task.project)
    else
      render action: 'edit'
    end
  end

  def destroy
    @task.destroy

    redirect_to @project
  end

  private
  
    def set_project
      @project = current_user.projects.find(params[:project_id])
    end

    def set_task
      @task = @project.tasks.find(params[:id])
    end


    def task_params
      params.require(:task).permit(:title, :description, :status, :project_id, :category_id)
    end
end


  
