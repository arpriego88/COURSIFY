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

  
end
