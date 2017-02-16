class Admin::CampaignsController < ApplicationController
  def index
    @campaigns = Campaign.all.order(:updated_at)
  end

  def create
    Campaign.create(date: Time.now.to_i)
    redirect_to admin_campaigns_path, notice: "Campaign Created"
  end

  def show
    @campaign = Campaign.find(params[:id])
  end
end