class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.text :response

      t.timestamps null: false
    end
  end
end
