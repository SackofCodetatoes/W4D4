class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    user = User.find(username: self.username)
    # session[:session_token] == user.session_token ? return user : return nil
  end

  def logged_in?
    session[:session_token] == self.session_token
  end

  def log_in_user!(user)
    if user
      session[:session_token] = user.generate_session_token
    end
  end
end
