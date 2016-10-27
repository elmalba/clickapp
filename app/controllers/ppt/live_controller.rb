class Ppt::LiveController < ActionController::Base

  def show

    Question.update_all({'status':'Nodisponible'})

    @question=Question.find(params[:id])
    @question.status="Disponible"
    @question.save


  end
  def index
    answer=Answer.new()
    answer.answer=params[:ans]
    answer.save()

    render plain:"ok"

  end
end
