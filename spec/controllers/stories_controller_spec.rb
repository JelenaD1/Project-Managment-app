require "rails_helper"
RSpec.describe StoriesController, type: :controller do
  context "While signed in", :aggregate_failures do
    before do
      @user = create(:user)
      sign_in @user
    end


    describe "GET index", :aggregate_failures do
      it "renders the list of stories" do
        story = create(:story, user: @user)

        get :index

        expect(response).to render_template :index
      end
    end


    describe "GET new" do
      it "renders the new template" do
        get :new, params: {user: @user}

        expect(response).to render_template :new
      end
    end


    describe "POST create", :aggregate_failures do
      it "creates a new story" do

        expect do
         post :create, params: valid_params.merge(user: @user)
        end.to change{Story.count}.by(1)

        expect(response).to redirect_to stories_path
      end

      it "re-renders new form with invalid params" do
        post :create, params: invalid_params.merge(user: @user)

        expect(response).to render_template :new
       end
    end


    describe "GET edit", :aggregate_failures do
      it "renders the edit form" do
        story = create(:story, user: @user)

        get :edit, params: {id: story.id}

        expect(response).to render_template :edit
      end
    end


    describe "POST update" do
      it "updates the story" do
        story = create(:story, user: @user)

        post :update, params: valid_params.merge(id: story.id)

        expect(response).to redirect_to stories_path
      end

      it "re-renders the form with invalid params" do
        story = create(:story, user: @user)

        post :update, params: invalid_params.merge(id: story.id)

        expect(response).to render_template :edit
      end
    end


    describe "DELETE destroy" do
      it 'deletes the story' do
        story = create(:story, user: @user)

        expect{delete :destroy, params: {id: story.id}}.to change{Story.count}.from(1).to(0)
        expect(response).to redirect_to stories_path
      end
    end



    def valid_params
      {
        story: {
          name: "JavaScript",
          description: "my first project",
          user: @user,
          start_date: Date.today
        }
      }
    end

    def invalid_params
      {
        story: {
          name: nil,
          description: "my first project",
          user: @user,
          start_date: Date.today
        }
      }
    end

  end
end
