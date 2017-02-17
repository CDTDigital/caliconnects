class Admin::CampaignsController < ApplicationController
  def index
    @campaigns = Campaign.all.where(archived: false).order(:updated_at)
  end

  def create
    campaign = Campaign.create(
      campaign_params.merge(date: Time.now.to_i)
    )

    redirect_to new_admin_campaign_alert_path(campaign), notice: "Campaign Created"
  end

  def show
    @campaign = Campaign.find(params[:id])
  end

  def destroy
    @campaign = Campaign.find(params[:id]).update(archived: true)

    redirect_to admin_campaigns_path, notice: "Campaign Archived"
  end

  private

  def campaign_params
    params.require(:campaign).permit(:category)
  end
end