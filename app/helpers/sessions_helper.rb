module SessionsHelper
    def sign_in
      @user.remember_token = @user.encrypted_remember_token
      @user.save
      cookies.permanent[:remember_token] = @user.remember_token
      session[:id] = @user.id
    end

    def current_user
      return @current_user ||= User.find_by(remember_token: session[:remember_token])
      return nil
    end

  def current_user=(user)
    @current_user = @user
  end

  def sign_out
    @current_user = nil
    cookies[:remember_token] = nil
    session[:id] = nil
  end
end
