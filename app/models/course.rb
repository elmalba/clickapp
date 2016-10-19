class Course
  include NoBrainer::Document
  include NoBrainer::Document::Timestamps

  field :institution, :type => Array
  field :code, :type => String, :required => true
  field :name, :type => String, :required => true
  field :section, :type => String
  field :teacher, :type => String
  field :assistant, :type => String
  field :created_by, :type => String
  field :students, :type => Array, :default => []
  field :request, :type => Array, :default => []


  def users_request
    User.where(:id.in request)
  end

  def users_students
    User.where(:id.in students)
  end


end
