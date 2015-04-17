class User < ActiveRecord::Base
  has_many :subscribes
  has_many :courses, through: :subscribes
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :courses, dependant: :destroy
  has_many :exercises, dependant: :destroy
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
