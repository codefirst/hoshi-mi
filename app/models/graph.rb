class Graph < ActiveRecord::Base
  TTL_DEFAULT = 1_000

  has_many :logs, :order => 'created_at ASC'
  belongs_to :created_by, :class_name => :User
  has_and_belongs_to_many :complex_graphs
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

  def recent_logs
    logs.reorder('happened_at DESC').limit(7)
  end

  def logs_by(resolution)
    logs.group_by{|log|
      resolution.beginning_of(log.happened_at)
    }.map{|date, logs|
      [ date, Log.average(logs) ]
    }.sort_by{|date,_|
      date
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
    default = (ENV['HOSHI_MI_TTL_MAX'] || TTL_DEFAULT).to_i
    self.ttl = [ self.ttl, default ].delete_if{|item|
      item == nil || item == 0
    }.min
  end
end
