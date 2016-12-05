class Answer
  include NoBrainer::Document
  include NoBrainer::Document::Timestamps

  field :user, :type => String #id del estudiante
  field :course,:type => String #id del curso de la pregunta, como se llena en un quiz?
  field :quiz,:type => String  #id del quiz
  field :question,:type => String #id de la pregunta
  field :origin,:type => String # origen: quiz o pregunta
  field :answer,:type => Integer #entero de la respuesta, validar con correct_answer de la id de la pregunta


  def user_answers
    User.where(:id => user)
  end

end

