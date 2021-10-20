class Task < ApplicationRecord
  belongs_to :project
  belongs_to :category
  validates :status, inclusion: { in: ['not-started', 'in-progress', 'complete'] }
  accepts_nested_attributes_for :category

  STATUS_OPTIONS = [
    ['Not started', 'not-started'],
    ['In progress', 'in-progress'],
    ['Complete', 'complete']
  ]
end
