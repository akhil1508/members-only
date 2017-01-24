class SessionsController < ApplicationController
  include SessionsHelper
  def new
  end

  def show
  end
  def create
    @user = User.find_by(email: params[:sessions][:email])
    if @user.authenticate(params[:sessions][:password])
      sign_in
      current_user=(@user)
      session[:user_id] = 1
      render 'show'
    end
  end
  def destroy
    sign_out
    redirect_to root_path
  end

  private
end
