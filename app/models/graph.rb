class Graph < ActiveRecord::Base
  TtlDefault = 1_000

  has_many :logs
  belongs_to :created_by, :class_name => :User
  attr_accessible :color, :name, :secret, :section, :service, :id, :created_by_id, :ttl, :created_at, :updated_at

  validates_format_of :service, :with => /[\w]+/
  validates_format_of :section, :with => /[\w]+/
  validates_format_of :name, :with => /[\w]+/

  # color format: empty, #FFF, #FFFFFF
  validates_format_of :color, :with => /^(?:|#(?:[0-9a-f]{3})(?:[0-9a-f]{3})?)$/i

  validates_numericality_of :ttl

  before_create :on_create
  before_save :on_save

  def owner?(user)
    return false if user.nil? or created_by.nil? or user.id.nil? or created_by.id.nil?
    user.id == created_by.id
  end

  def as_json(options = {})
    if not options.has_key?(:current_user) or not owner?(options[:current_user])
      options[:except] ||= :secret
    end
    super(options)
  end

  def logs_by(resolution)
    xs = logs.group_by{|item|
      resolution.beginning_of(item.happened_at)
    }.map{|key, values|
      ys = values.map{|v| v.number }
      [ key, ys.sum.to_f / ys.size ]
    }.sort_by{|item|
      item.first
    }
  end

  private
  def on_create
    self.color = '#0b62a4' if self.color.blank?
    self.secret = random_str
  end

  def random_str
    UUIDTools::UUID.random_create.to_s.delete("-")
  end

  def on_save
    self.ttl = [ self.ttl, ENV['HOSHI_MI_TTL_MAX'].to_i, TtlDefault ].delete_if{|item|
      item == nil || item == 0
    }.min
  end
end
