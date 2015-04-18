class User < ActiveRecord::Base
  has_many :subscribes
  has_many :courses, through: :subscribes
  has_many :completes
  has_many :lessons, through: :completes
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #has_many :courses, dependent: :destroy
  has_many :exercises, dependent: :destroy
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
