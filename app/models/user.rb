class User < ActiveRecord::Base
  has_many :subscribes, dependent: :destroy
  has_many :courses, through: :subscribes
  has_many :completes, dependent: :destroy
  has_many :lessons, through: :completes
  has_many :exercises
  enum role: %w(student teacher admin)
  
  def subscribed
    self.subscribed = true
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #has_many :courses, dependent: :destroy
  
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:twitter]
  after_create :email_user

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = "changeme@#{auth.uid}#{auth.provider}.com"
      user.name = auth.info.name
      user.password = user.password_confirmation = Devise.friendly_token[0,20]
    end 
  end

  # def self.new_with_sessions(params, session)
  #   super.tap do |user|
  #     if data = session["devise.twitter_data"] && session["devise.twitter_data"]["extra"]["raw_info"]
  #       user.provider = session["devise.twitter_data"]["provider"]
  #       user.uid = session["devise.twitter_data"]["uid"]
  #       user.name = data["name"] if user.name.blank?
  #       user.email = data["email"] if user.email.blank?
  #     end
  #   end
  # end
  #setting up emails sent out to users upon sign up/ password resets and account conformations
  

  # def to_param
  #   uid
  # end

  private

  def email_user
    UserMailer.user_welcome(self).deliver 
  end
  

end
