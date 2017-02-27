describe "welcome" do
  context "index" do
    it "shows the landing page" do
      visit root_path
      expect(page).to have_content "We want you to stay safe!"
      expect(page).to have_content "Sign up for emergency alerts!"
      expect(page).to have_content "Our new system can now send location based alerts. This means if you get an alert, the system has intelligently determined that you NEED the details to stay safe, because you are within the affected area. This also means you won't receive alerts that don't affect you."
    end

    it "links to the sign up page" do
      visit root_path

      click_button "Sign Up"

      expect(current_path).to eq new_user_registration_path
    end

    it "links to the login page" do
      visit root_path

      click_button "Login"

      expect(current_path).to eq new_user_session_path
    end

    it "has a preparedness page" do
      visit preparedness_path

      expect(page).to have_content("be prepared!")
    end
  end
end
