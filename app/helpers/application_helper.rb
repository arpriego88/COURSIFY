module ApplicationHelper

  def course_complete_check(course, user_id)
    if course.check_if_course_complete?(user_id) 
      # content_tag(:i)
      raw('<i class= "fa fa-check-circle-o" style= "color: green;"></i>')
    else
      raw('<i class= "fa fa-circle-o" style= "color: red;"></i>')
    end 
  end

  def lesson_complete_check(lesson, current_user)
    if lesson.users.include?(current_user)
      link_to fa_icon("check-circle-o"), complete_path(id: lesson.id), method: :delete, style: "color: green"
    else 
      link_to fa_icon("circle-o"), completes_path(lesson_id: lesson.id), method: :post, style: "color: red"
    end
  end

  def lesson_complete(lesson, current_user)
    if lesson.users.include?(current_user)
      raw('<i class= "fa fa-check-circle-o" style= "color: green;"></i>')
    else 
      raw('<i class= "fa fa-circle-o" style= "color: red;"></i>')
    end
  end
end
