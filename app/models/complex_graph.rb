class ComplexGraph < ActiveRecord::Base
  belongs_to :created_by, :class_name => :User
  has_and_belongs_to_many :graphs
  attr_accessible :name, :section, :service

  def owner?(user)
    return false if user.nil? or created_by.nil? or user.id.nil? or created_by.id.nil?
    user.id == created_by.id
  end

  def logs_by(resolution)
    ids = graphs.map{|item| item.id }
    Log.where(:graph_id => ids).
      group_by{|item|
        resolution.beginning_of(item.happened_at)
      }.map{|time, logs|
        xs = logs.
          group_by{|item| item.graph }.
          map{|key, values| { key => Log.average(values) }}.
          reduce(:merge)
        [time, xs]
      }.sort_by{|item|
        item.first
      }
  end
end
