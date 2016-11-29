class QuestionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    return render json:Question.find(params[:id])
  end

  def index
    if request.format.json?
      return render json:Question.pluck(:id, :question_asked, :time, :user, :answers, :type_answer, :courses, :points, :subject).all()
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    question = Question.find(params[:id])
    question.update(question_asked: params[:question_asked], answers: params[:answers], points: params[:points], time: params[:time], correct_answer: params[:correct_answer], subject: params[:subject], courses: params[:courses])
    redirect_to question_path
  end

  def destroy
    question= Question.find(params[:id])
    render json:{:status => question.destroy}
  end


  def new
    @question = Question.new
  end

  def create
    question = Question.new(question_params)
    if params[:type_answer] == 'shortAnswer'
      question.correct_answer = nil
      #question.answers = [] PROBAR
    end
    if params[:type_answer] == 'trueFalse'
      question.answers = ["true", "false"]
    end

    question.user = @current_user.id
    question.answers.delete("")

    if question.save?
      render json:question
    end

  end



  private

  def question_params
    params.require(:question).permit!.to_h
  end


end