class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks
  has_many :categories, through: :tasks


  validates_presence_of :name

  def status
    return "not-started" if tasks.none?

    if tasks.all?(&:complete?)
      "complete"
    elsif tasks.any? { |task| task.in_progress? || task.complete? }
      "in-progress"
    else
      "not-started"
    end
  end

  def total_complete
    tasks.count(&:complete?)
  end

  def total_tasks
    tasks.count
  end

  def percent_complete
    return 0 if tasks.none?

    ((total_complete.to_f / total_tasks) * 100).round
  end


  def self.completed_projects(user)
    all.where(user: user).select { |project| project.percent_complete == 100 }
  end

  # or
  # scope :complete_projects, ->(user) { where(user: user).select { |project| project.percent_complete == 100 } }


  def self.non_completed_projects(user)
    all.where(user: user).select { |project| project.percent_complete < 100 }
  end
end
