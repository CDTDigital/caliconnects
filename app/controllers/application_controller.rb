class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def verify_is_admin
    authenticate_user!

    unless current_user.admin
      redirect_to root_url, message: "You are not authorized to do that!"
    end
  end
end
