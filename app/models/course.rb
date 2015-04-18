class Course < ActiveRecord::Base
  has_many :lessons, dependent: :destroy
  has_many :subscribes, dependent: :destroy
  has_many :users, through: :subscribes

  validates :name, presence: true
  validates :description, presence: true
  

end
