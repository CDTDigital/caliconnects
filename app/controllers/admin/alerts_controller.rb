class Admin::AlertsController < ApplicationController
  def new
    @campaign = Campaign.find(params[:campaign_id])
    @alert = Alert.new
  end

  def create
    redirect_to admin_campaigns_path, notice: "Alert Created"
  end
end