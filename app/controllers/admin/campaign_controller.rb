class Admin::CampaignController < ApplicationController
  def index
    @campaigns = Campaign.all.order(:updated_at)
  end

  def create
    Campaign.create(date: Time.now.to_i)

    redirect_to :admin_campaign_index
  end
end