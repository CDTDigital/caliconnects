describe "welcome" do
  context "index" do
    it "shows the landing page" do
      visit root_path
      expect(page).to have_content "We want you to stay safe!"
      expect(page).to have_content "Sign up for emergency alerts!"
      expect(page).to have_content "Our new system can now send location based alerts. This means if you get an alert, the system has intelligently determined that you NEED the details to stay safe, because you are within the affected area. This also means you won't receive alerts that don't affect you."
    end
  end
end
