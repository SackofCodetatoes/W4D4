class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logout

  def current_user
    return nil if session[:session_token] == nil
    user = User.find_by(session_token: session[:session_token])
    return user
  end


  def logout
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def logged_in?
    !!current_user
  end

  def log_in_user!(user)
    session[:session_token] = user.session_token
      # debugger
  end
end
