class Admin::AlertsController < ApplicationController
  before_action :verify_is_admin

  def new
    @campaign = Campaign.find(params[:campaign_id])
    @alert = Alert.new
  end

  def create
    campaign = Campaign.find(params[:campaign_id])

    @alert = Alert.create(alert_params.merge(campaign_id: campaign.id))

    redirect_to admin_campaign_path(campaign), notice: "Alert Created"

    @alert.send_notifications(params, preparedness_url)
  end

  private

  def alert_params
    params.require(:alert).permit(:description, :severity)
  end
end