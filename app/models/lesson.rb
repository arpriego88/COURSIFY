class Lesson < ActiveRecord::Base
  belongs_to :course

  after_update :check_course_completion

  def check_course_completion
    # Check all the lessons
    @lesson = self
    @course = @lesson.course
    @completed = @course.lessons.map {|lesson| lesson.complete?}
    if @completed.include?(false)
      @course.complete = false
    else
      @course.complete = true
    end
    @course.save
  end
end
