class LessonsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_course


  def show
    @lesson = @course.lessons.find(params[:id])
  end

  def new
    @lesson = @course.lessons.new
  end

  def create
    @lesson = @course.lessons.build(lesson_params)
    if @lesson.save
      flash[:success] = "Lesson created!"
      redirect_to @course
    else
      flash[:alert] = "Something went wrong. Try again!"
      redirect_to new_course_lesson_path
    end
  end

  def edit
    @lesson = @course.lessons.find(params[:id])
  end

  def update
    @lesson = @course.lessons.find(params[:id])
    if @lesson.update_attributes(lesson_params)
      flash[:success] = "Lesson updated!"
      redirect_to @course
    else
      flash[:alert] = "Something went wrong. Try again!"
      redirect_to edit_course_lesson_path
    end
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    redirect_to @course
  end

  private

  def set_course
    @course = Course.find(params[:course_id])
  end

  def lesson_params
    params.require(:lesson).permit(:name, :description, :content, :video_url, :video_time, :exercise_name, :exercise_content, :complete, :teacher_id)
  end

end
