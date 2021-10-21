class Task < ApplicationRecord
  belongs_to :project
  belongs_to :category
  validates :status, inclusion: { in: ['not-started', 'in-progress', 'complete'] }
  validates_presence_of :title
  accepts_nested_attributes_for :category

  STATUS_OPTIONS = [
    ['Not started', 'not-started'],
    ['In progress', 'in-progress'],
    ['Complete', 'complete']
  ]

  def complete?
    status == 'complete'
  end

  def in_progress?
    status == 'in-progress'
  end

  def not_started?
    status == 'not-started'
  end


end
