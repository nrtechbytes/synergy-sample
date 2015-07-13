class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound do
    flash[:warning] = 'Resource not found.'
    redirect_back_or root_path
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  def redirect_back_or(path)
    redirect_to request.referer || path
  end

  def authenticate_blogger
    current_user.admin?
  end

  def blogit_admin_sign_out_url
    destroy_user_session_path
  end

  def current_blogger
    current_user
  end


  def blog
    redirect_to "hhttps://nrtechbytes.wordpress.com#{request.fullpath.gsub('/blog','')}", :status => :moved_permanently
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:account_update) << :name
  end
end