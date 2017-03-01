describe Admin::AlertsController do
  context "signed in admin" do
    let(:admin) { create(:user, admin: true) }
    before(:each) do sign_in admin end

    context "create" do
      let(:campaign) { create(:campaign) }
      let!(:user) { create(:user) }
      let(:alert_description) { "take shelter" }
      let(:alert_params) { {
          campaign_id: campaign.id,
          alert: {
              description: alert_description
          }
      } }

      it "creates an alert" do
        expect {
          post :create, params: alert_params
        }.to change { Alert.count }.by(1)
      end

      it "sends sms for alert to user" do
        new_sms = double

        allow(SmsService).to receive(:new).and_return(new_sms)
        allow(new_sms).to receive(:send_message)

        post :create, params: alert_params

        expected_sms_body = alert_description + " click here for more info: " + preparedness_url + "?id=" + Alert.last.id.to_s

        expect(new_sms).to have_received(:send_message).with(user.phone, expected_sms_body)
      end

      it "adds opened_total and received_total to the alert" do
        post :create, params: alert_params

        alert = Alert.last

        expect(alert.received_total).to be > 0
        expect(alert.opened_total).to be > 0
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
