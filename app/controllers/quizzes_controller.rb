class QuizzesController < ApplicationController
  

  def new
    @course = Course.find(params[:course_id])
    @lesson = Lesson.find(params[:lesson_id])
    @quiz = @lesson.quizzes.build

    5.times { @quiz.questions.build }
    @quiz.questions.each do |question| 
      4.times { question.answers.build }
    end
  end

  def create
    @course = Course.find(params[:course_id])  
    @lesson = Lesson.find(params[:lesson_id])
    @lesson.quizzes.build(quiz_params)
    if @lesson.save
      flash[:success] = "Quiz Created"
    else
      flash[:danger] = "Something went wrong"
    end
    redirect_to course_lesson_path(@course, @lesson)
  end

  def show
    @course = Course.find(params[:course_id])  
    @lesson = Lesson.find(params[:lesson_id])
    @quiz = @lesson.quizzes.find(params[:id])
  end

  private

  def quiz_params
    params.require(:quiz).permit(:title, questions_attributes: [:content, answers_attributes: [:content, :correct]])
  end


end
