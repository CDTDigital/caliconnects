describe "user sign up" do
  it "lets users create an account" do
    visit new_user_registration_path

    fill_in :user_first_name, with: "brenda"
    fill_in :user_last_name, with: "awesome"

    # click_button "Next"

    fill_in :user_email, with: "brenda@example.com"

    # click_button "Next"

    fill_in :user_password, with: "jillsecret"

    # click_button "Next"

    fill_in :user_phone, with: "4155555555"

    # click_button "Next"

    fill_in :address, with: "3 Alley Lane, San Francisco 94105"
  end
end