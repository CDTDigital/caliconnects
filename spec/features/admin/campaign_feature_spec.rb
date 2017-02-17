describe "campaign" do
  context "create" do
    it "lets the admin create a campaign" do
      visit admin_campaigns_path

      select "earthquake", from: :campaign_category

      click_on 'create campaign'

      expect(page).to have_content "Campaign Created"
      expect(page).to have_content Time.now.strftime("%A, %d %b %Y %H:%M %p")
      expect(page).to have_content "Earthquake"
    end
  end

  context "show" do
    let!(:campaign) { create(:campaign) }
    let!(:alert) { create(:alert, campaign: campaign) }

    it "lets the admin view details for a campaign" do
      visit admin_campaigns_path

      click_on "show"

      expect(current_path).to eq admin_campaign_path(campaign)
      expect(page).to have_content alert.description
    end
  end

  context "index" do
    let!(:campaign) { create(:campaign) }

    it "admin can create an alert for a campaign" do
      visit admin_campaigns_path

      click_on "create alert"

      fill_in :alert_description, with: "tsunami warning"

      click_on "create alert"

      expect(page).to have_content "Alert Created"
      expect(page).to have_content "tsunami warning"

      expect(current_path).to eq admin_campaign_path(campaign)
    end
  end
end