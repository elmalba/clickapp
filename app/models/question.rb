class Question
  include NoBrainer::Document
  include NoBrainer::Document::Timestamps

  field :question_asked, :type => String, :required => true
  field :time, :type => String #Cambiar a time
  field :user, :type => String
  field :answers, :type => Array, :default => []
  field :type_answer, :type => String, :required => true
  field :courses, :type => Array, :default => []
  field :correct_answer, :type => Integer
  field :points, :type => Integer
end
