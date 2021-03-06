require "rails_helper"

describe "when user visits the project show page" do
  before do
    @user = create(:user)
    sign_in @user
  end

  it "displays the project information", :aggregate_failures do
    project = create(:project, user: @user, name: "Rails project")

    visit project_path(project)

    expect(page).to have_content("Rails project")
  end

  it "has a button to edit the project", :aggregate_failures do
    project = create(:project, user: @user, name: "Rails project")

    visit project_path(project)

    click_link "Edit"

    expect(page.current_path).to eq edit_project_path(project)
  end

  it "has a back button to go to index page", :aggregate_failures do
    project = create(:project, user: @user, name: "Rails project")

    visit project_path(project)

    click_link "Back"

    expect(page.current_path).to eq projects_path
  end

  it "has a button to delete the project", :aggregate_failures do
    project = create(:project, user: @user, name: "Rails project")

    visit project_path(project)

    accept_confirm do
      click_link "delete project"
    end

    expect(page.current_path).to eq projects_path
  end

  it "has a button to create a new task", :aggregate_failures do
    project = create(:project, user: @user, name: "Rails project")

    visit project_path(project)

    click_link "Add new task"

    expect(page.current_path).to eq new_project_task_path(project)
  end

  it "has a list of projects tasks", :aggregate_failures do
    project = create(:project, user: @user, name: "JavaScript is my nightmare")
    task = create(:task, project: project, title: "Need a set up")

    visit project_path(project)

    expect(page).to have_content "JavaScript is my nightmare"
    expect(page).to have_content "Need a set up"
  end

  it "has a edit button to edit the task", :aggregate_failures do
    project = create(:project, user: @user, name: "JavaScript is my nightmare")
    task = create(:task, project: project, title: "Need a set up")

    visit project_path(project)

    click_on(id: "edit task")

    expect(page.current_path).to eq edit_project_task_path(task, project)
  end

  it "has a delete button to delete the task", :aggregate_failures do
    project = create(:project, user: @user)
    task = create(:task, project: project)

    visit project_path(project)

    accept_confirm do
      click_on(id: "delete task")
    end

    expect(page.current_path).to eq project_path(project)
  end
end
