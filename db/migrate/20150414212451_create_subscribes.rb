class CreateSubscribes < ActiveRecord::Migration
  def change
    create_table :subscribes do |t|
      t.references :user, index: true
      t.references :course, index: true

      t.timestamps null: false
    end
    add_foreign_key :subscribes, :users
    add_foreign_key :subscribes, :courses
  end
end
