class Course < ActiveRecord::Base
  has_many :lessons, dependent: :destroy
  has_many :subscribes, dependent: :destroy
  has_many :users, through: :subscribes

  validates :name, presence: true
  validates :description, presence: true
  

  def check_if_course_complete?(user_id)
    self.lessons.lazy.all?{|lesson| lesson.completes.find_by_user_id(user_id) } 
  end
end
