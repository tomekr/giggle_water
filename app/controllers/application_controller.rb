class ApplicationController < ActionController::Base
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  after_filter :prepare_unobtrusive_flash

  #TODO Fix this
  #XXX This is also in the ApplicationHelper. This isnt' very DRY which leads
  #me to believe this is not the correct place for this. I'm on a plane right
  #now with no internet so I'll have to leave this here for now.
  def current_bar
    if current_user
      return current_user.current_bar
    else
      return nil
    end
  end
end
