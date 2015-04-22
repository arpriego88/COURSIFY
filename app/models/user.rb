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

  #setting up emails sent out to users upon sign up/ password resets and account conformations
  after_create :email_user

  def to_param
    uuid
  end

  private

  def email_user
    UserMailer.user_welcome(self).deliver 
  end
  
end
