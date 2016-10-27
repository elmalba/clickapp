class Ppt::LiveController < ActionController::Base

  def show

    Question.update_all({'status':'Nodisponible'})

    @question=Question.find(params[:id])
    @question.status="Disponible"
    @question.save


  end
  def index
    answer=Answer.new()
    question=Question.where(:status=>"Disponible").first()
    p question
    answer.question=question.id
    answer.answer=params[:ans]
    answer.save()

    render plain:"ok"

  end
end
