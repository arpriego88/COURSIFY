class CompletesController < ApplicationController
  before_action :authenticate_user!

  def create
    @lesson = Lesson.find(params[:lesson_id])
    @complete = Complete.create(user_id: current_user.id, lesson_id: @lesson.id)
    redirect_to request.referer
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @complete = Complete.find_by(user_id: current_user.id, lesson_id: @lesson.id)
    @complete.destroy
    redirect_to request.referer  
  end

end