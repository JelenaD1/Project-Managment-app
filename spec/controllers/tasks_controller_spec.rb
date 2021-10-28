require "rails_helper"
RSpec.describe TasksController, type: :controller do

  context "While signed in" do
    before do
      @user = create(:user)
      sign_in @user
    end

    describe "GET index" do
      it "assigns the list of the tasks" do
        project = create(:project, user: @user)
        task = create(:task, project: project)

        get :index, params: {project_id: project.id}

        expect(assigns(:tasks)).to include(task)
      end
    end


    describe "GET new" do
      it "renders the new template" do
        project = create(:project, user: @user)

        get :new, params: {project_id: project.id}

        expect(response).to render_template(:new)
      end
    end


    describe "POST create" do
      it "creates a new task" do
        project = create(:project, user: @user)
        category = create(:category)

        expect do
          post :create, params: valid_params(project, category).merge(project_id: project.id)
        end.to change{Task.count}.from(0).to(1)
      end
    end



    def valid_params(project, category)
      {
        task: {
          title: "JavaScript",
          description: "my first project",
          project_id: project.id,
          category_id: category.id,
          status: "complete"

        }
      }

    end






  end

end
