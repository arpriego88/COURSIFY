class CoursesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!

  def index
    @courses = Course.all
    @course = Course.find(params[:id])
    @user = current_user
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      flash[:success] = "Course Created"
      redirect_to courses_path
    else
      flash[:danger] = "Please fill in every field"
      render :new
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])

    if @course.update(course_params)
      flash[:success] = "Your course has been updated"
      redirect_to courses_path
    else
      render :new
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to courses_path
  end

  private

  def course_params
    params.require(:course).permit(:name, :description, :lesson_name, :lesson_description, :complete, :teacher_id)
  end


end
