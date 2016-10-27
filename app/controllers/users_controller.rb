class UsersController < ApplicationController
  layout 'login', :only => [:new, :create]
  skip_before_action :login_required, :only => [:new, :create]

  def index
    if @current_user.role == 'admin'
       if request.format.json?
        return render json:User.pluck(:id, :name, :lastname, :role, :rut, :email).all()
       end
    elsif @current_user.role == 'teacher'
      if request.format.json?
        return render json:User.where(:role => 'student').all()
      end
    else
      redirect_to root_path
    end
  end


  def show
    @user = User.find(params[:id])
  end


  def new
    @user = User.new
  end


  def create
    if [params[:user][:password]] == [params[:user][:confpassword]]
    @user = User.new(user_params)
    @user.institution = []
    @user.institution  << [params[:user][:institution]]

    if [params[:user][:role]] != 'student' || [params[:user][:role]] != 'teacher'
      @user.role = 'student'
    end

    if @user.save?
        log_in @user
        redirect_to root_path
      else
        render "new"
      end
    else
      @user = User.new
      flash.now[:notice] = "Algo sucedió, inténtalo de nuevo."
      render "new"
    end
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def edit
  end

  private


  def user_params
  params.require(:user).permit(:rut, :name, :lastname, :institution, :role, :email, :password).to_h
  #AGREGAR INSTITUTION
  end

end
