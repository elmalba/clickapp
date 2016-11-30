class Api::LoginController < Api::ApiController


  def index
    email = params[:email]
    passwd= params[:passwd]

    user = User.where(:email=>email).first()
    if user and  user.password==passwd

      return render json:{'status':TRUE,'id':user.id}
    else
      return render json:{'status':FALSE}
    end

  end

  def create
    return index

  end
end
