describe "campaign" do
  context "create" do
    it "lets the admin create a campaign" do
      visit admin_campaign_index_path

      click_on 'create campaign'

      expect(page).to have_content Time.now.strftime("%A, %d %b %Y %H:%M %p")
    end
  end
end