class ComplexGraph < ActiveRecord::Base
  belongs_to :created_by
  has_many_and_belongs_to :graph
  attr_accessible :name, :section, :service
end
