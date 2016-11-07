class CoursesController < ApplicationController
  skip_before_action :verify_authenticity_token


  def index

    if request.format.json?
        return render json:Course.all()
    end
  end

  def show
    @course = Course.find(params[:id])
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    if @course.update_attributes(course_params)
      render 'edit' #flash?
    else
      render 'edit'
    end
  end

  def new
    @course = Course.new
  end

  def destroy
    course= Course.find(params[:id])

    render json:{:status => course.destroy}
  end

  def acceptRequest
    @course = Course.find(params[:id])
    @course.students.push(params[:user])
    @course.request.delete(params[:user])
    @course.save
    render 'show'
  end

  def deleteRequest
    @course = Course.find(params[:id])
    @course.request.delete(params[:user])
    @course.save
    render 'show'
  end


  def create
    course = Course.new(course_params)
    course.created_by = @current_user.name
    if @current_user.role == 'teacher'
      course.teacher=@current_user.id
    end
    if course.name.nil? || course.code.nil?
      render 'new' #ALERT SOMETHING
    else
      course.save
      render json:course
    end
  end

  private

  def course_params
    params.require(:course).permit(:name, :code, :section, :teacher, :assistant).to_h
    #AGREGAR INSTITUTION y ALUMNOS
  end

end
