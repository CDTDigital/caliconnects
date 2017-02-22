describe "user sign up" do
  it "lets users create an account", js: true do
    visit new_user_registration_path

    fill_in :user_first_name, with: "brenda"
    fill_in :user_last_name, with: "awesome"

    within "#signup-page-1" do
      find("#signup-page__next-button").click
    end

    fill_in :user_email, with: "brenda@example.com"

    within "#signup-page-2" do
      find("#signup-page__next-button").click
    end

    fill_in :user_password, with: "jillsecret"
    fill_in :user_password_confirmation, with: "jillsecret"

    within "#signup-page-3" do
      find("#signup-page__next-button").click
    end

    fill_in :user_phone, with: "4155555555"

    within "#signup-page-4" do
      find("#signup-page__next-button").click
    end

    fill_in :address, with: "3 Alley Lane, San Francisco 94105"
  end
end