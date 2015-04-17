class Complete < ActiveRecord::Base
  belongs_to :user
  belongs_to :lesson

  after_update :check_course_completion

  def check_course_completion
    # Check all the lessons
    @user = current_user
    @lesson = @user.lessons.find(params[:lesson_id])
    @current_course = @lesson.course
    @cid = @current_course.id
    @course_lessons = @user.lessons.find_by(course_id: @cid )
    @w = @course_lessons.sort
    @v = @course.lessons.map {|lesson| lesson.id}
    @lids = @v.sort
    if @ids == @lids
         @course.complete = true
    else
      @course.complete = false
    end
    @course.save
  end
end
