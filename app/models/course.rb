class Course < ActiveRecord::Base
  has_many :lessons
  has_many :subscribes
  has_many :users, through: :subscribes

  validates :name, presence: true
  validates :description, presence: true
  

end
