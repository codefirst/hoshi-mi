class Users::OmniauthCallbacksController < ApplicationController
  def twitter
    uid = env["omniauth.auth"]["uid"]
    name = env["omniauth.auth"]["info"]["nickname"]
    user = User.find_by_uid(uid) || User.create!(:uid => uid, :name => name)
    sign_in_and_redirect user
  end
end
