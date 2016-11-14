class User
  include NoBrainer::Document
  include NoBrainer::Document::Timestamps

  field :name, :type => String, :required => true
  field :lastname, :type => String, :required => true
  field :role, :type => String
  field :rut, :type => String, :required => true, :unique => true
  field :email, :type => String, :required => true, :unique => true
  field :password, :type => String, :required => true
  field :institution, :type => Array
  field :courses, :type => Array
  field :history_quiz, :type => Array
  field :last_login, :type => Array
  field :last_mobile, :type => Array

end

def select_form
  "#{name} #{lastname} | #{email}"
end