class Course < ActiveRecord::Base
  has_many :lessons, dependent: :destroy
  has_many :subscribes, dependent: :destroy
  has_many :users, through: :subscribes

  has_attached_file :image, :styles => { :medium => "300x300#", :thumb => "100x100#" }
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }
  
  validates :name, presence: true
  validates :description, presence: true
  validates :image, presence: true

  def check_if_course_complete?(user_id)
    self.lessons.lazy.all?{|lesson| lesson.completes.find_by_user_id(user_id) } 
  end
end
