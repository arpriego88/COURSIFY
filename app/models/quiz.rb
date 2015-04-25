class Quiz < ActiveRecord::Base
  has_many :questions, dependent: :destroy

  belongs_to :exercise
end
