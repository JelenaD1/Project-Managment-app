class Mentor < ApplicationRecord
  has_many :reviews
  has_many :stories, through: :reviews
end 
  
