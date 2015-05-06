class CoursesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  respond_to :html, :js

  def index
    @courses = Course.all
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

  def heat_map
    # @count = params[:counter]
    @lesson = Lesson.find(params[:lesson_id])
  end

  private

  def course_params
    params.require(:course).permit(:name, :description, :lesson_name, :lesson_description, :complete, :teacher_id, :image)
  end


end
