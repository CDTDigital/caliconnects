class Admin::AlertsController < ApplicationController
  def new
    @campaign = Campaign.find(params[:campaign_id])
    @alert = Alert.new
  end

  def create
    campaign = Campaign.find(params[:campaign_id])

    Alert.create(alert_params.merge(campaign_id: campaign.id))

    redirect_to admin_campaign_path(campaign), notice: "Alert Created"
  end

  private

  def alert_params
    params.require(:alert).permit(:description)
  end
end