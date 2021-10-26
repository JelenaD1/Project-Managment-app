require "rails_helper"

RSpec.describe Task, type: :model do

  describe ".new" do
    it "returns new instance of task with attributes" do
      project = build(:project)
      task = create(:task, project: project)

      expect(task).to be_valid
    end
  end



  describe "#complete?" do
    it "returns true if  status is complete" do
      project = build(:project)
      task = create(:task, project: project, status: "complete")

      expect(task.complete?).to eq(true)
    end

    it "returns false if staus is in-progress" do
      project = build(:project)
      task = create(:task, project: project, status: "in-progress")

      expect(task.complete?).to eq(false)
    end
  end


  describe "#in_progress?" do
    it "returns true if  status is in_progress" do
      project = build(:project)
      task = create(:task, project: project, status: "in-progress")

      expect(task.in_progress?).to eq(true)
    end

    it "returns false if status is complete" do
      project = build(:project)
      task = create(:task, project: project, status: "complete")

      expect(task.in_progress?).to eq(false)
    end

  end


  describe "#not_started?" do
    it "returns true if  status is not-started" do
      project = build(:project)
      task = create(:task, project: project, status: "not-started")

      expect(task.not_started?).to eq(true)
    end

    it "returns false if status is in-progress" do
      project = build(:project)
      task = create(:task, project: project, status: "in-progress")

      expect(task.not_started?).to eq(false)
    end

  end


end
