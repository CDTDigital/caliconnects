class Admin::CampaignsController < ApplicationController
  def index
    @campaigns = Campaign.all.order(:updated_at)
  end

  def create
    Campaign.create(
        campaign_params.merge(date: Time.now.to_i)
    )

    redirect_to admin_campaigns_path, notice: "Campaign Created"
  end

  def show
    @campaign = Campaign.find(params[:id])
  end

  private

  def campaign_params
    params.require(:campaign).permit(:category)
  end
end