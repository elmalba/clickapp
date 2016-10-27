class Question
  include NoBrainer::Document
  include NoBrainer::Document::Timestamps

  field :question_asked, :type => String, :required => true
  field :time, :type => Integer, :default => 60 #AL PASARLO A TIME, DA ERROR (1970)
  field :user, :type => String
  field :subject, :type => String
  field :answers, :type => Array, :default => []
  field :type_answer, :type => String, :required => true
  field :courses, :type => Array, :default => []
  field :correct_answer, :type => Integer
  field :status, :type => String
  field :points, :type => Integer
end
