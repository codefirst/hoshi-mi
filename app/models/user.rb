class User < ActiveRecord::Base
  devise :omniauthable

  attr_accessible :ui, :name, :icon_url
end
