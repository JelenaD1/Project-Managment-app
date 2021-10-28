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
























  end

end
