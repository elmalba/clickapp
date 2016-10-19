class Quiz
  include NoBrainer::Document
  include NoBrainer::Document::Timestamps

  field :name, :type => String
  field :courses, :type => Array
  field :type, :type => String
  field :time, :type => Float
  field :questions, :type => Array
  field :students, :type => Array
  field :mode , :type =>String

end
