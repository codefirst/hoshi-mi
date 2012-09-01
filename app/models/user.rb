class User < ActiveRecord::Base
  devise :omniauthable

  attr_accessible :uid, :name, :icon_url
end
