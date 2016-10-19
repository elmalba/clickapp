class Institution
  include NoBrainer::Document
  include NoBrainer::Document::Timestamps

  field :name, :type => String
  field :area, :type => String
  field :school, :type => String
  field :rut, :type => String
  field :responsable, :type => String
end
