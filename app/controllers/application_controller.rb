class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    current_user_path
  end

  def after_sign_out_path_for(resource_or_scope)
    request.referrer
  end

  def index
    # TODO check if user is logged in. If not, then redirect to login page.

    render html: "TODO redirects..."
  end
end
