class AddCourseToLessons < ActiveRecord::Migration
  def change
    add_reference :lessons, :course, index: true
    add_foreign_key :lessons, :courses
  end
end
