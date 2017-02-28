describe Admin::CampaignsController do
  context "signed in admin" do
    let(:user) { create(:user, admin: true) }
    before(:each) do sign_in user end

    context "create" do
      it "creates a campaign" do
        campaign_params = {
            campaign: {
                category: "earthquake"
            }
        }

        expect {
          post :create, params: campaign_params
        }.to change { Campaign.count }.by(1)
      end
    end

    context "destroy" do
      let(:campaign) { create(:campaign, archived: false) }

      it "archives a campaign" do
        campaign_params = {id: campaign.id}

        delete :destroy, params: campaign_params

        archived_campaign = Campaign.find(campaign.id)

        expect(archived_campaign.archived).to be true
      end
    end
  end

  context "roles" do
    let(:nonadmin_user) { create(:user) }

    it "doesn't allow non-admin users access" do
      sign_in nonadmin_user

      get :index

      expect(response).to redirect_to(root_path)
    end
  end
end