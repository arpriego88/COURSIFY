class RegistrationsController < Devise::RegistrationsController
  # One feature of rails is that it only allows white listed parameters to be accessed
  # Since the default devise controllers are in the gem, we can't add extra fields to the database unless we change the registrations controller.
  # Up top, you can see that we're inheriting from the Devise::RegistrationsController.
  # This means that all of our default Devise stuff works, and we can add some extras
  # In this case, I added the attributes name and bio to the model and changed the sign_up and account_update params to reflect that.
  
  def destroy
    customer = Stripe::Customer.retrieve(current_user.stripeid)
    customer.subscriptions.retrieve(current_user.subscriptionid).delete
    super
  end

  private

  def sign_up_params
    params.require(:user).permit(:uid, :provider, :name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:uid, :provider, :name, :email, :password, :password_confirmation, :current_password)
  end

  def after_sign_up_path_for(resource)
    '/charges/new'
  end
end