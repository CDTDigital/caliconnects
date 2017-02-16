describe "campaign" do
  context "create" do
    it "lets the admin create a campaign" do
      visit admin_campaigns_path

      click_on 'create campaign'

      expect(page).to have_content Time.now.strftime("%A, %d %b %Y %H:%M %p")
    end
  end

  context "show" do
    it "lets the admin view details for a campaign" do
      campaign = create(:campaign)

      visit admin_campaigns_path

      click_on "create alert"

      fill_in :alert_description, with: "earthquake warning"

      click_on "create alert"

      click_on "show"

      expect(current_path).to eq admin_campaign_path(campaign)
      expect(page).to have_content "earthquake warning"
    end
  end

  context "managing alerts" do
    it "admin can create an alert for a campaign" do
      create(:campaign)

      visit admin_campaigns_path

      click_on "create alert"

      fill_in :alert_description, with: "tsunami warning"

      click_on "create alert"

      expect(page).to have_content "Alert Created"
    end
  end
end