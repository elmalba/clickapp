class Ppt::LiveController < ActionController::Base

  def show
    @question=Question.find(params[:id])
  end
  def index
    answer=Answer.new()
    answer.answer=params[:ans]
    answer.save()

    render plain:"ok"

  end
end
