describe Admin::CampaignsController do
  context "signed in admin" do
    let(:admin) { create(:user, admin: true) }
    before(:each) do
      sign_in admin
    end

    context "create" do
      let!(:user) { create(:user) }

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

      it "notifies users" do
        new_sms = double

        allow(SmsService).to receive(:new).and_return(new_sms)
        allow(new_sms).to receive(:send_message)

        campaign_params = {
            campaign: {
                category: "earthquake",
                alerts: {
                    description: "take shelter"
                }
            }
        }

        post :create, params: campaign_params

        expected_sms_body = "Alert from California Connects: " + "take shelter -- click here for more info: " + preparedness_url + "?id=" + Alert.last.id.to_s

        expect(new_sms).to have_received(:send_message).with(user.phone, expected_sms_body)
      end

      it "only notifies users in the target area" do
        new_sms = double

        allow(SmsService).to receive(:new).and_return(new_sms)
        allow(new_sms).to receive(:send_message)

        campaign_params = {
          campaign: {
            category: "earthquake",
            alerts: {
              description: "take shelter"
            }
          },
          city: "denver"
        }

        post :create, params: campaign_params

        expected_sms_body = "Alert from California Connects: " + "take shelter -- click here for more info: " + preparedness_url + "?id=" + Alert.last.id.to_s

        expect(new_sms).to_not have_received(:send_message).with(user.phone, expected_sms_body)
      end
    end

    context "destroy" do
      let(:campaign) { create(:campaign, archived: false) }

      it "archives a campaign" do
        campaign_params = { id: campaign.id }

        delete :destroy, params: campaign_params

        archived_campaign = Campaign.find(campaign.id)

        expect(archived_campaign.archived).to be true
      end
    end

    context "show" do
      it "redirects to the index page if campaign not found" do
        bad_campaign_id = 1

        get :show, params: { id: bad_campaign_id }

        expect(response).to redirect_to(admin_campaigns_path)
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