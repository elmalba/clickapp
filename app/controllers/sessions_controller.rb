class SessionsController < ApplicationController
  skip_before_action :login_required, :only => [:new, :create]
  layout "login"

  def new
    @user = User.new
  end

  def create
    user = User.where(:email => params[:session][:email].downcase).first

    if user && user.password == params[:session][:password]
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash.now[:notice] = "Usuario o contraseña no encontrado"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end


  private
  def login(user)
    session[:user_id] = nil
  end

end
