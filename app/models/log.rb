class Log < ActiveRecord::Base
  belongs_to :graph
  attr_accessible :graph_id, :happened_at, :number

  private
  def self.average(xs)
    ys = xs.map{|x| x.number }
    ys.sum.to_f / ys.size
  end
end
