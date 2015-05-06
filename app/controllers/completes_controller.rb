class CompletesController < ApplicationController
  before_action :authenticate_user!

  def create
    @lesson = Lesson.find(params[:lesson_id])
    @complete = Complete.create(user_id: current_user.id, lesson_id: @lesson.id)
    if params['from_lesson'] == 'true' && @lesson.next_lesson.present?
      redirect_to course_lesson_path(@lesson.course, @lesson.next_lesson)
    elsif @next_lesson.present? == false
      redirect_to course_path(@lesson.course)
    else
      redirect_to request.referer
    end
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @complete = Complete.find_by(user_id: current_user.id, lesson_id: @lesson.id)
    @complete.destroy
    redirect_to request.referer  
  end

end