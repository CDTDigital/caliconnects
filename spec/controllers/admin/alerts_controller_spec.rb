describe Admin::AlertsController do
  context "create" do
    let(:campaign) { create(:campaign) }

    it "creates a alert" do
      alert_params = {
        campaign_id: campaign.id,
        alert: {
          description: "take shelter"
        }
      }

      expect{
        post :create, params: alert_params
      }.to change{ Alert.count }.by(1)
    end
  end
end
