class QuestionsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def show

  end

  def index

    if request.format.json?

      return render json:Question.all()
    end

  end


  def new
    @question = Question.new
  end

  def create

    p params
    question = Question.new(question_params)
    question.answers=params[:answers]
    question.user = @current_user.rut
    if params[:type_answer] == 'shortAnswer'
      question.correct_answer=nil
    end
    if params[:type_answer] == 'multipleChoice'
      question.correct_answer=question.correct_answer-1
    end
    question.save
    render json:question
  end

  def destroy
    question= Question.find(params[:id])

    render json:{:status => question.destroy}
  end




  private

  def question_params
    params.require(:question).permit(:question_asked, :type_answer, :correct_answer, :time).to_h
    #AGREGAR NAME
    #AGREGAR INSTITUTION
  end


end
