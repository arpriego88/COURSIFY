class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :name
      t.text :description
      t.string :video_url
      t.string :video_time
      t.text :content
      t.string :exercise_name
      t.text :exercise_content

      t.timestamps null: false
    end
  end
end
