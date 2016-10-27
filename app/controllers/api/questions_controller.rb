class Api::QuestionsController <Api::ApiController

  def index

    question=Question.where(:status=>"Disponible").first()

    if params['check']
      return render  json:{'id':question.id}
    end

    objeto={
        "_id":question.id,
        "category":[
            question.courses[0]
        ],
        "answer":question.correct_answer,
        "options":[
            question.answers[0],
            question.answers[1],
            question.answers[2],
            question.answers[3]
        ],
        "title":question.question_asked,
        "appId":"ionicquiz",
        "cobjectId":"questions",
        "actions":{
            "comments":[

            ],
            "ratings":{
                "users":[

                ],
                "avg":0,
                "total":0
            },
            "votes":{
                "users_downvote":[

                ],
                "users_upvote":[

                ],
                "users":[

                ],
                "total":0
            }
        },
        "dt_update":question.updated_at,
        "dt_create":question.created_at,
        "__v":0,
        "id":question.id
    }

    pagination={"page":1,"per_page":20,"total_pages":1,"total_elements":1}

    render json:{'pagination':pagination,'data':[objeto]}
  end

  def create

    p "aca"
    p params
    question=Question.where(:status=>"Disponible").first()
    answer=Answer.new()
    answer.answer=params[:respuesta]
    answer.question=question.id
    p "HOLA"
    answer.save()

    render plain:answer

  end

end



