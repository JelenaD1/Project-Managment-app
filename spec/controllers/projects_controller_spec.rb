require "rails_helper"
RSpec.describe ProjectsController, type: :controller do

  context "While signed in", :aggregate_failures do
    before do
      @user = create(:user)
      sign_in @user
    end


    describe "GET index", :aggregate_failures do
     it "renders the list of all projects" do
      project = create(:project, user: @user)

      get :index

      expect(response).to render_template :index
      end
    end


    describe "GET show" do
      it "renders the project show template", :aggregate_failures do
        project = create(:project, user: @user)
        task = create(:task, project: project)

        get :show, params: { id: project.id, user_id: @user.id }

        expect(response).to render_template :show
        expect(assigns(:tasks)).to include(task)
      end
    end


    describe "GET new", :aggregate_failures do
      it "renders the new template" do
        get :new, params: {user: @user}

        expect(response).to render_template(:new)
      end
    end


    describe "POST create", :aggregate_failures do
      it "creates a new instance of the project" do

       expect do
        post :create, params: valid_params.merge(user: @user)
       end.to change{Project.count}.from(0).to(1)

       project = Project.first
       expect(response).to redirect_to project
      end

      it "re-renders new template with invalid params" do
        post :create, params: invalid_params.merge(user: @user)

        expect(response).to render_template(:new)
      end
    end


    describe "GET edit", :aggregate_failures do
      it "renders the edit form" do
       project = create(:project, user: @user)

       get :edit, params: {id: project.id, user: @user}

       expect(response).to render_template(:edit)
      end
    end


    describe "POST update", :aggregate_failures do
      it "updates the project" do
        project = create(:project, user: @user)

        post :update, params: valid_params.merge(id: project.id, user: @user)

        expect(response).to redirect_to project
      end

      it "re-renders the form with invalid input" do
        project = create(:project, user: @user)

        post :update, params: invalid_params.merge(id: project.id, user: @user)

        expect(response).to render_template(:edit)
      end
    end


    describe "DELETE destroy" do
      it "deletes a project" do
        project = create(:project, user: @user)

        expect do
          delete :destroy, params: {id: project.id, user: @user}
        end.to change{Project.count}.from(1).to(0)
        expect(response).to redirect_to projects_url
      end
    end



    def valid_params
      {
        project: {
        name: "JavaScript",
        description: "my first project",
        user: @user,
        github: "this is link to github",
        start_date: Date.today

        }
      }
    end

    def invalid_params
      {
        project: {
        name: nil,
        description: "my first project",
        user: @user,
        github: "this is link to github",
        start_date: Date.today

        }
      }
    end

  end

end
