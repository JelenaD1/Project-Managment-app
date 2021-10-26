class Story < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :mentors, through: :reviews

  validates_presence_of :name

  def self.search(search)
    if search
      where(["name LIKE ?", "%#{search}%"])
    else
      all
    end
  end
end
