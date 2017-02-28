describe Admin::AlertsController do
  context "signed in admin" do
    let(:admin) { create(:user, admin: true) }
    before(:each) do sign_in admin end

    context "create" do
      let(:campaign) { create(:campaign) }
      let!(:user) { create(:user) }

      it "creates an alert" do
        alert_params = {
            campaign_id: campaign.id,
            alert: {
                description: "take shelter"
            }
        }

        expect {
          post :create, params: alert_params
        }.to change { Alert.count }.by(1)
      end

      it "sends sms for alert to user" do
        new_sms = double

        allow(SmsService).to receive(:new).and_return(new_sms)
        allow(new_sms).to receive(:send_message)

        alert_description = "take shelter"

        alert_params = {
            campaign_id: campaign.id,
            alert: {
                description: "take shelter"
            }
        }

        post :create, params: alert_params

        expected_sms_body = alert_description + " click here for more info: " + preparedness_url + "?id=" + Alert.last.id.to_s

        expect(new_sms).to have_received(:send_message).with(user.phone, expected_sms_body)
      end
    end
  end

  context "roles" do
    let(:nonadmin_user) { create(:user) }
    let(:campaign) { create(:campaign) }

    it "doesn't allow non-admin users access" do
      sign_in nonadmin_user

      get :new, params: {campaign_id: campaign.id}

      expect(response).to redirect_to(root_path)
    end
  end
end
