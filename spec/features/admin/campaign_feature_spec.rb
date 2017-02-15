describe "campaign" do
  context "create" do
    it "lets the admin create a campaign" do
      visit admin_campaigns_path

      click_on 'create campaign'

      expect(page).to have_content Time.now.strftime("%A, %d %b %Y %H:%M %p")
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