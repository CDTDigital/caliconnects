describe "campaign" do
  let(:admin) { create(:user, admin: true) }
  before :each do
    login_as(admin)
  end

  context "new" do
    it "lets the admin create a campaign" do
      visit admin_campaigns_path

      click_button "Create New Campaign"

      fill_in :campaign_name, with: "blueberry pie"

      fill_in :campaign_alerts_description, with: "tsunami warning"

      choose :campaign_alerts_severity_voluntary_evacuation

      click_on 'Send Notification'

      campaign = Campaign.last

      expect(current_path).to eq admin_campaigns_path

      expect(page).to have_content "Campaign Created"

      within("#active-campaigns") do
        expect(page).to have_content Time.now.strftime("%A, %d %b %Y %H:%M %p")
        expect(page).to have_content "blueberry pie".capitalize

        expect(page).to have_content "Voluntary Evacuation"
      end
    end
  end

  context "show" do
    let!(:campaign) { create(:campaign) }
    let!(:alert) { create(:alert, campaign: campaign, received_total: 14, opened_total: 10) }

    it "lets the admin view details for a campaign and its alerts" do
      visit admin_campaigns_path

      click_on "show"

      expect(current_path).to eq admin_campaign_path(campaign)

      expect(page).to have_content "Total Recipients: " + alert.received_total.to_s
      expect(page).to have_content "Confirmed: " + alert.opened_total.to_s
      expect(page).to have_content "Not Confirmed: " + (alert.received_total - alert.opened_total).to_s
    end

    it "admin can end campaigns" do
      visit admin_campaign_path(campaign)

      click_on "end campaign"

      expect(page).to have_content "Campaign Archived"
    end
  end

  context "index" do
    let!(:campaign) { create(:campaign) }

    it "admin can create an alert for a campaign" do
      visit admin_campaigns_path

      click_on "create alert"

      fill_in :alert_description, with: "tsunami warning"

      choose :alert_severity_voluntary_evacuation

      click_on "Send Notification"

      expect(page).to have_content "Alert Created"
      expect(page).to have_content "tsunami warning"

      expect(current_path).to eq admin_campaign_path(campaign)
    end

    it "admin can end campaigns" do
      visit admin_campaigns_path

      click_on "end campaign"

      within("#active-campaigns") do
        expect(page).to_not have_content campaign.formatted_date
      end

      within("#archived-campaigns") do
        expect(page).to have_content campaign.formatted_date
      end

      expect(page).to have_content "Campaign Archived"
    end
  end
end
