class ChangeLessons < ActiveRecord::Migration
  def change
    change_column :lessons, :complete, :boolean, default: false
  end
end
