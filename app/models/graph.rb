class Graph < ActiveRecord::Base
  attr_accessible :color, :created_by, :name, :secret, :section, :service
end
