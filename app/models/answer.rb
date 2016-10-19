class Answer
  include NoBrainer::Document
  include NoBrainer::Document::Timestamps

  field :user, :type => String
  field :course,:type => String
  field :quiz,:type => String
  field :question,:type => String
  field :answer,:type => Integer


end
