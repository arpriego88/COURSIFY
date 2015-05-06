class SessionsController < Devise::SessionsController
  respond_to :html, :js

  def new
    super
  end
end
