class WelcomeController < ApplicationController
  def index
    if current_user && current_user.admin
      redirect_to admin_campaigns_path
    elsif current_user
      redirect_to edit_user_registration_path
    end
  end

  def preparedness
    if params[:id]
      alert = Alert.find(params[:id])

      alert.update(opened_total: (alert.opened_total += 1))
    end
  end

  def terms
  end
end
