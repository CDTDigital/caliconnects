describe "alerts" do
  context "create" do
    let(:admin) { create(:user, admin: true) }
    let(:sf_user) { create(:user, admin: false) }
    let(:la_user) { create(:user, admin: false) }
    let(:campaign) { create(:campaign) }
    let(:new_sms) { double }

    before :each do
      login_as(admin)

      sf_user.addresses.create(
          id: sf_user.id,
          street: "happy street",
          zipcode: "94105",
          state: "CA",
          city: "San Francisco"
      )
      la_user.addresses.create(
          id: la_user.id,
          street: "awesome street",
          zipcode: "90028",
          state: "CA",
          city: "Los Angeles"
      )

      allow(SmsService).to receive(:new).and_return(new_sms)
      allow(new_sms).to receive(:send_message)
    end

    it "sends alerts to everyone in system when no location is provided" do
      visit new_admin_campaign_alert_path(campaign)

      fill_in :alert_description, with: "tsunami warning"

      choose :alert_severity_voluntary_evacuation

      click_on 'Send Notification'

      expect(new_sms).to have_received(:send_message).exactly(2).times
    end

    xit "sends alerts to everyone in a city when a city is provided", js: true do
      visit new_admin_campaign_alert_path(campaign)

      fill_in :alert_description, with: "tsunami warning"

      choose :alert_severity_voluntary_evacuation

      click_on "City Level"

      fill_in :city, with: "San Francisco"

      click_on 'Send Notification'

      expect(new_sms).to have_received(:send_message).exactly(1).times
    end
  end
end