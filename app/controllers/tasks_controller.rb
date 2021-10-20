require 'pry'
class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_category_collection


  def index
    @tasks = @project.tasks
  end

  def show
  end

  def new
    @task = @project.tasks.build

  end

  def edit
  end

  def create
    @task = @project.tasks.build(task_params)
    if @task.save
      redirect_to @project, notice: "New task was created!"
    else
      render action: 'new'
    end
  end

  def update
    if @task.update(task_params)
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

    def set_category_collection
      @all_categories = Category.all
    end 
end


  
