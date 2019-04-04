class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def current_user
    User.find_by(uuid: user_uuid)
  end

  def user_uuid
    params[:uuid]
  end
end
