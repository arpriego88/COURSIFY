class Course < ActiveRecord::Base
  belongs_to :user
  has_many :lessons

  validates :name, presence: true
  validates :description, presence: true
  

end
