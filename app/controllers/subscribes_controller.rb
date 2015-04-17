class SubscribesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @course = Course.find(params[:course_id])
    @subscription = Subscribe.create(user_id: current_user.id, course_id: @course.id)
    redirect_to courses_path
  end


  def destroy
    @course = Course.find(params[:id])
    @subscription = Subscribe.find_by(user_id: current_user.id, course_id: @course.id)
    @subscription.destroy
    redirect_to courses_path
  end

end