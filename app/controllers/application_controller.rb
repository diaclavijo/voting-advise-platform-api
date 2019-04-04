class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def current_user
    User.find_by(uuid: user_uuid)
  end

  def user_uuid
    cookies.permanent.encrypted[:uuid] = SecureRandom.base58 if cookies.encrypted[:uuid].nil?
    cookies.encrypted[:uuid]
  end
end
