class Quiz < ActiveRecord::Base
  belongs_to :lesson
  has_many :questions, dependent: :destroy

  accepts_nested_attributes_for :questions, reject_if: proc { |attributes| attributes['content'].blank? }
end
