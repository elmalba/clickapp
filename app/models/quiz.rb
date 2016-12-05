class Quiz
  include NoBrainer::Document
  include NoBrainer::Document::Timestamps

  field :name, :type => String, :required => true
  field :courses, :type => Array, :default => []
  field :type, :type => String, :default => 'users'
  field :time, :type => Float
  field :questions, :type => Array, :default => []
  field :students, :type => Array, :default => []
  field :mode , :type =>String
  field :user,  :type =>String #Creador (docente)

  def users_students
    User.where(:id.in students)
  end

end
