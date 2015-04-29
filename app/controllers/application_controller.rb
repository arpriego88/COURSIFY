class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    if current_user.subscribed?
      redirect_to root_path, alert: exception.message
    else
      redirect_to new_charges_path, alert: 'You Need to Subscribe to Continue!'
    end
  end
end
