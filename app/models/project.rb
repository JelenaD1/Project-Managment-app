require "pry"
class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks
  has_many :categories, through: :tasks

  validates_presence_of :name

  def status
    return 'not-started' if tasks.none?
    if tasks.all? { |task| task.complete? }
      'complete'
    elsif tasks.any? { |task| task.in_progress? || task.complete? }
      'in-progress'
    else
      'not-started'
    end
  end

  def total_complete
    tasks.select { |task| task.complete? }.count
  end

  def total_tasks
    tasks.count
  end

  def percent_complete
    return 0 if tasks.none?
    ((total_complete.to_f / total_tasks) * 100).round
  end

  def self.completed_projects(user)
    all.where(user: user).select{|project| project.percent_complete == 100}
  end

  def self.non_completed_projects(user)
    all.where(user: user).select{|project| project.percent_complete < 100}
  end 

 
end
