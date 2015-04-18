class CreateCompletes < ActiveRecord::Migration
  def change
    create_table :completes do |t|
      t.references :user, index: true
      t.references :lesson, index: true

      t.timestamps null: false
    end
    add_foreign_key :completes, :users
    add_foreign_key :completes, :lessons
  end
end
