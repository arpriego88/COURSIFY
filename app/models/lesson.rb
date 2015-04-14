class Lesson < ActiveRecord::Base
  belongs_to :course

  after_update :check_course_completion

  def check_course_completion
    # Check all the lessons
    @lesson = self
    @course = @lesson.course
    @completed = @course.lessons.map {|lesson| lesson.complete}
    @course.complete = true unless @completed.include?(false)
    @course.save
  end
end
