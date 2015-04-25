class Exercise < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :user
  has_many :quizzes, dependent: :destroy
end
