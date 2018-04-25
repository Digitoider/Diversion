class ApplicationController < ActionController::Base

  def after_inactive_sign_up_path_for(resource)
    @registerd = true
    render 'index'
  end

  def after_sign_in_path_for(resource)
    # redirect to main page
    '/'
  end

  def after_sign_out_path_for(resource_or_scope)
    '/users/sign_in'
  end

  def index
    if !user_signed_in?
      return redirect_to '/users/sign_up'
    end

    return render 'index'
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

end
