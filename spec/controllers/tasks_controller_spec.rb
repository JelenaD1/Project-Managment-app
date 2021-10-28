require "rails_helper"
RSpec.describe TasksController, type: :controller do

  context "While signed in" do
    before do
      @user = create(:user)
      sign_in @user
    end

    describe "GET index", :aggregate_failures do
      it "assigns the list of the tasks" do
        project = create(:project, user: @user)
        task = create(:task, project: project)

        get :index, params: {project_id: project.id}

        expect(assigns(:tasks)).to include(task)
      end
    end


    describe "GET new" do
      it "renders the new template", :aggregate_failures do
        project = create(:project, user: @user)

        get :new, params: {project_id: project.id}

        expect(response).to render_template(:new)
      end
    end


    describe "POST create", :aggregate_failures do
      it "creates a new task" do
        project = create(:project, user: @user)
        category = create(:category)

        expect do
          post :create, params: valid_params(project, category).merge(project_id: project.id)
        end.to change{Task.count}.from(0).to(1)
      end

      it "re-renders new template with invalid params" do
        project = create(:project, user: @user)
        category = create(:category)

        post :create, params: invalid_params(project, category).merge(project_id: project.id)

        expect(response).to render_template(:new)
      end
    end


    describe "GET edit", :aggregate_failures do
      it "renders the edit form" do
        project = create(:project, user: @user)
        task = create(:task, project: project)

        get :edit, params: {id: task.id, project_id: project.id}

        expect(response).to render_template(:edit)
      end
    end


    describe "POST update", :aggregate_failures do
      it "updates the task" do
        project = create(:project, user: @user)
        task = create(:task, project: project)
        category = create(:category)

        post :update, params: valid_params(project, category).merge(project_id: project.id)

        expect(response).to redirect_to project_ul
      end

      it "re-renders the form with invalid input" do
        project = create(:project, user: @user)
        task = create(:task, project: project)
        category = create(:category)

        post :update, params: invalid_params(project, category).merge(project_id: project.id)

        expect(response).to render_template(:edit)
      end
    end


    describe "DELETE destroy" do
      it "deletes the task" do
        project = create(:project, user: @user)
        task = create(:task, project: project)

        expect do
          delete :destroy, params: {id: task.id, project_id: project.id}
        end.to change{Task.count}.from(1).to(0)
        expect(response).to redirect_to project_url
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


    def invalid_params(project, category)
      {
        task: {
          description: "my first project",
          project_id: project.id,
          category_id: category.id,
          status: "complete"
        }
      }
    end

  end

end
