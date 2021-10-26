require 'rails_helper'
RSpec.describe Project, type: :model do

  describe ".new" do
    it "make a new instance with attributes" do
      project = build(:project)

      expect(project).to be_valid
    end

    it "fails if name is not present" do
      project = build(:project, name: nil)

      expect(project).to_not be_valid
    end
  end


  describe "#status" do
    it "returns non-started if there is no tasks" do
      project = build(:project)

      expect(project.status).to eq("not-started")
    end

    it "returns complete if all tasks are completed" do
      project = create(:project)
      task = create(:task, project: project)

      expect(project.status).to eq("complete")
    end

    it "returns in-progress if any tasks is not complete" do
      project = create(:project)
      task = create(:task, project: project, status: "in-progress")

      expect(project.status).to eq("in-progress")
    end

    it "returns not-started if all tasks are not-started" do
      project = create(:project)
      task = create(:task, project: project, status: "not-started")

      expect(project.status).to eq("not-started")
    end
  end


  describe "#total_complete" do
    it "returns total count of completed tasks" do
      project = create(:project)
      task = create(:task, project: project, status: "complete")

      expect(project.total_complete).to eq(1)
    end
  end


  describe "#total_tasks" do
    it "returns total count on project tasks" do
      project = create(:project)
      task = create(:task, project: project)

      expect(project.total_tasks).to eq(1)
    end
  end


  describe "#percent_complete" do
    it "returns 0 if there is no tasks" do
      project = create(:project)

      expect(project.percent_complete).to eq(0)
    end

    it "returns project percent complete" do
      project = create(:project)
      2.times do
      task = create(:task, project: project, status: "complete")
      end

      expect(project.percent_complete).to eq(100)
    end
  end


end
