class AddCompleteToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :complete, :boolean, default: false
  end
end
