class Api::CoursesController < Api::ApiController

  def index
    course=Course.find("44oGwcH67QYaIU")

    objeto={"_id":course.id,
            "description":course.code,
            "excerpt":course.teacher,
            "image":"https://snap-photos.s3.amazonaws.com/img-thumbs/280h/GFIZG3CMEB.jpg",
            "name":course.name,
            "appId":"ionicquiz",
            "cobjectId":"categories",
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
            "dt_update":course.updated_at,
            "dt_create":course.created_at,
            "__v":0,
            "id":course.id

    }

    data=[objeto]

    pagination={"page":1,"per_page":20,"total_pages":1,"total_elements":3}

    render json:{'pagination':pagination,'data':data}
  end

  def show
    course=Course.find(params[:id])

    objeto ={"_id":params[:id],"description":course.code,"excerpt":"Hello World!","image":"https://snap-photos.s3.amazonaws.com/img-thumbs/280h/GFIZG3CMEB.jpg","name":course.name,"appId":"ionicquiz","cobjectId":"categories","actions":{"comments":[],"ratings":{"users":[],"avg":0,"total":0},"votes":{"users_downvote":[],"users_upvote":[],"users":[],"total":0}},"dt_update":"2016-04-27T10:01:52.976Z","dt_create":"2016-04-27T10:01:52.976Z","__v":0,"id":"57208e1096030f96665ccb55"}
    render json:objeto

  end

end
