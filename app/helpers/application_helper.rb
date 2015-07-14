module ApplicationHelper
  #XXX Is this the right place for this? It seems like it is since helpers are
  #available in the views
  def current_bar
    if current_user
      return current_user.current_bar
    else
      return nil
    end
  end
end
