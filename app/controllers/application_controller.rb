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


end
