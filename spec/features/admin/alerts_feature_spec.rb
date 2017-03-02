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

    it "sends an email alerts to users" do
      visit new_admin_campaign_alert_path(campaign)

      fill_in :alert_description, with: "tsunami warning"

      choose :alert_severity_voluntary_evacuation

      expect { click_on 'Send Notification' }.to change{ ActionMailer::Base.deliveries.count }.by(2)
    end

    context "location levels" do
      it "sends alerts to everyone in system when no location is provided" do
        visit new_admin_campaign_alert_path(campaign)

        fill_in :alert_description, with: "tsunami warning"

        choose :alert_severity_voluntary_evacuation

        click_on 'Send Notification'

        expect(new_sms).to have_received(:send_message).exactly(2).times
      end

      it "sends alerts to everyone in a city when a city is provided", js: true do
        visit new_admin_campaign_alert_path(campaign)

        fill_in :alert_description, with: "tsunami warning"

        choose :alert_severity_voluntary_evacuation

        click_on "City Level"

        fill_in :city, with: "San Francisco"

        click_on 'Send Notification'

        expect(new_sms).to have_received(:send_message).exactly(1).times
      end

      it "sends alerts to everyone in a zip when a zip is provided", js: true do
        visit new_admin_campaign_alert_path(campaign)

        fill_in :alert_description, with: "tsunami warning"

        choose :alert_severity_voluntary_evacuation

        click_on "Zip Level"

        fill_in :zipcode, with: "94105"

        click_on 'Send Notification'

        expect(new_sms).to have_received(:send_message).exactly(1).times
      end

      it "sends alerts to everyone in a street when a street is provided", js: true do
        visit new_admin_campaign_alert_path(campaign)

        fill_in :alert_description, with: "tsunami warning"

        choose :alert_severity_voluntary_evacuation

        click_on "Street Level"

        fill_in :street, with: "happy street"
        fill_in :street_city, with: "San Francisco"

        click_on 'Send Notification'

        expect(new_sms).to have_received(:send_message).exactly(1).times
      end
    end
  end
end
