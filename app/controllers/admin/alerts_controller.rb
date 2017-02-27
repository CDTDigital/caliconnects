class Admin::AlertsController < ApplicationController
  def new
    @campaign = Campaign.find(params[:campaign_id])
    @alert = Alert.new
  end

  def create
    campaign = Campaign.find(params[:campaign_id])

    @alert = Alert.create(alert_params.merge(campaign_id: campaign.id))

    redirect_to admin_campaign_path(campaign), notice: "Alert Created"

    User.all.each do |user|
      if user.phone
        SmsService.new.send_message(user.phone, @alert.description)
      end
    end
  end

  private

  def alert_params
    params.require(:alert).permit(:description)
  end
end