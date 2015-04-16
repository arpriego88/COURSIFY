class SubscribesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @course = Course.find(params[:course_id])
    @subscription = Subscribe.create(user_id: current_user.id, course_id: @course.id)
    redirect_to request_referer
  end


  def destroy


  end

end