class ApplicationController < ActionController::Base
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  after_filter :prepare_unobtrusive_flash
  
  helper_method :current_bar

  def current_bar
    if current_user
      return current_user.current_bar
    else
      return nil
    end
  end
end
