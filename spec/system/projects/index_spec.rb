require "rails_helper"

describe "when user visit the project index page" do
  before do
    @user = create(:user)
    sign_in @user
  end

  it "displays the list of the projects", :aggregate_failures do
    project = create(:project, user: @user, name: "Rails project")

    visit projects_path

    expect(page).to have_content "Rails project"
  end

  it "has a button to create a new project", :aggregate_failures do
    visit projects_path

    click_link "New Project"

    expect(page.current_path).to eq new_project_path
  end

  it "has a button project details", :aggregate_failures do
    project = create(:project, user: @user, name: "Rails project")

    visit projects_path

    click_link "Project details"

    expect(page.current_path).to eq project_path(project)
  end

end
