class QuizzesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @quiz = Quiz.new
  end

  def index

    if request.format.json?
      return render json:Quiz.all()
    end
  end

  def create
    quiz = Quiz.new(quiz_params)
    if quiz.save?
      render json:quiz
    end
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
