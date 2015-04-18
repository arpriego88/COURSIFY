class Lesson < ActiveRecord::Base
  has_many :completes
  has_many :users, through: :completes
  belongs_to :course
  has_many :exercises


  # after_update :check_course_completion

  def check_course_completion
    # Check all the lessons
    # @lesson = self
  #   @course = @lesson.course
  #   @completed = @course.lessons.map {|lesson| lesson.complete?}
  #   if @completed.include?(false)
  #     @course.complete = false
  #   else
  #     @course.complete = true
  #   end
  #   @course.save
  # end
  end
end


