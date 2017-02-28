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
    @campaign = Campaign.new
    @campaign.alerts.build
  end

  def create
    campaign = Campaign.new(
      campaign_params.merge(date: Time.now.to_i)
    )

    if campaign.save
      campaign.alerts.create(alert_params)

      redirect_to admin_campaigns_path, notice: "Campaign Created"
    end
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
    params.require(:campaign).permit(:name)
  end

  def alert_params
    alert_params = params.dig(:campaign, :alerts)

    alert_params.permit(:severity, :description) if alert_params
  end
end
