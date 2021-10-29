require "rails_helper"

describe "when user visits the new page" do

  before do
    @user = create(:user)
    sign_in @user
  end

  it " submits the form", :aggregate_failures do
    visit new_project_path(@user)

    fill_in "Name", with: "System tests"

    click_button "Create Project"

    project = Project.find_by(name: "System tests")

    expect(page).to have_content("System tests")
    expect(page.current_path).to eq project_path(project)
  end

  it "displays the errors when input is invalid", :aggregate_failures do
    visit new_project_path(@user)

    click_button "Create Project"

    expect(page).to have_content "prohibited this project from being saved"
  end
end
