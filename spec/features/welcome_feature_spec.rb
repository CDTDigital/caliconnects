describe "welcome" do
  context "index" do
    it "shows the landing page" do
      visit root_path
      expect(page).to have_content "We want you to stay safe!"
      expect(page).to have_content "Sign up to receive alerts from your state and local government"
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

      expect(page).to have_content("Be Prepared")
    end
  end

  it "links to the sign up page" do
    visit root_path

    click_link 'help'

    expect(current_path).to eq help_path

    fill_in :subject, with: "Subject"

    fill_in :question, with: "I have a question"

    click_button "Send"

    expect(status_code).to eq 200
  end
end
