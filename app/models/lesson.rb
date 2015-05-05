class Lesson < ActiveRecord::Base
  has_many :completes
  has_many :users, through: :completes
  belongs_to :course
  has_many :exercises
  has_many :quizzes, dependent: :destroy


  # after_update :check_course_completion

  def next_lesson
     self.class.where('id > ?', id).order('id ASC').first
  end
end


