class Graph < ActiveRecord::Base
  belongs_to :created_by, :class_name => :User
  attr_accessible :color, :name, :secret, :section, :service

  validates_format_of :service, :with => /[\w]+/
  validates_format_of :section, :with => /[\w]+/
  validates_format_of :name, :with => /[\w]+/

  before_create :on_create

  private
  def on_create
    self.color = '#0000ff' if self.color.blank?
    self.secret = random_str
  end

  def random_str
    UUIDTools::UUID.random_create.to_s.delete("-")
  end

end
