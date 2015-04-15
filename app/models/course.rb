class Course < ActiveRecord::Base
  has_many :lessons
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
  

end
