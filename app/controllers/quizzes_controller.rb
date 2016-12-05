class QuizzesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    respond_to do |format|
      format.html {  @quiz = Quiz.find(params[:id]) }
      format.json { render json:Quiz.find(params[:id])}
    end
  end

  def new
    @quiz = Quiz.new
  end

  def index
    if request.format.json?
      return render json:Quiz.all()
    end
  end

  def edit
    @quiz = Quiz.find(params[:id])
  end

  def update
    quiz = Quiz.find(params[:id])
    quiz.update(name: params[:name], type: params[:type], time: params[:time], courses: params[:courses], questions: params[:questions])
    redirect_to quiz_path
  end

  def create
    quiz = Quiz.new(quiz_params)
    quiz.user = @current_user.id
    if quiz.save?
      render json:quiz
    end
      render 'new'
  end

  def destroy
    quiz= Quiz.find(params[:id])
    render json:{:status => quiz.destroy}
  end

  private

  def quiz_params
    params.require(:quiz).permit!.to_h
  end

end
