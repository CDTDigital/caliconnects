class Admin::CampaignsController < ApplicationController
  before_action :verify_is_admin
  include Swagger::Blocks

  swagger_path '/campaigns' do
   operation :get do
     key :description, 'campaigns'
     response 200 do
       key :description, 'returns a list of all campaigns'
     end
   end
 end

  def index
    @campaigns = Campaign.all.order(:updated_at)
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
