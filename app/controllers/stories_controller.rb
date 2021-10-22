class StoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_story, only: [:show, :edit, :update, :destroy]
  
  def index
    @stories = current_user.stories
  end 

  def show
  end 

  def new
    @story = current_user.stories.build
  end

  def create
    @story = current_user.stories.build(story_params)
    if @story.save
      redirect_to @story, notice: 'Story was successfully created.' 
    else
      render :new
    end
  end 

  def edit
  end 

  def destroy
  end

  private

  def set_story
    @story = current_user.stories.find(params[:id])
  end 

  def story_params
    params.require(:story).permit(:name, :description, :link, :start_date)
  end 


end
