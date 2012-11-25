class ComplexGraph < ActiveRecord::Base
  belongs_to :created_by, :class_name => :User
  has_and_belongs_to_many :graphs
  attr_accessible :name, :section, :service
end
