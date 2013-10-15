class Users::OmniauthCallbacksController < ApplicationController
  define_method Settings.omniauth.provider do
    uid = env["omniauth.auth"]["uid"]
    name = env["omniauth.auth"]["info"]["nickname"]
    icon_url = env["omniauth.auth"]["info"]["image"]
    user = User.find_by_uid(uid) || User.create!(:uid => uid, :name => name)
    user.icon_url = icon_url
    user.save!
    sign_in_and_redirect user
  end
end
