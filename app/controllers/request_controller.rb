class RequestController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    course = Course.find(params[:id])
    course.request.push(@current_user.id)
    course.save
    render json:course
  end

  def update
    course = Course.find(params[:id])
    course.request.delete(@current_user.id)
    course.students.push(@current_user.id)
    course.update
    render json:course
  end

end
