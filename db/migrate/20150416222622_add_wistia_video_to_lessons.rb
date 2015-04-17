class AddWistiaVideoToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :wistia_video, :string
  end
end
