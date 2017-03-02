describe "user sign up" do
  it "lets users create an account through a paged experience", js: true do
    visit new_user_registration_path

    fill_in :user_first_name, with: "brenda"
    fill_in :user_last_name, with: "awesome"

    within "#signup-page-1" do
      find("#signup-page__next-button").click
    end

    fill_in :user_password, with: "jillsecret"
    fill_in :user_password_confirmation, with: "jillsecret"

    within "#signup-page-2" do
      find("#signup-page__next-button").click
    end

    fill_in :user_email, with: "brenda@example.com"

    within "#signup-page-3" do
      find("#signup-page__next-button").click
    end

    fill_in :user_phone, with: "4155555555"

    within "#signup-page-4" do
      find("#signup-page__next-button").click
    end

    fill_in :address, with: "3 Alley Lane, San Francisco 94105"

    within "#signup-page-5" do
      find("#signup-page__next-button").click
    end

    click_button "Sign up"

    expect(page).to have_content "check ur phone"
    expect(current_path).to eq user_confirmation_path

    visit user_success_path

    expect(page).to have_content "Great job."
  end

  it "lets users enter an address without js" do
    visit new_user_registration_path

    fill_in :user_first_name, with: "brenda"
    fill_in :user_last_name, with: "awesome"

    fill_in :user_password, with: "jillsecret"
    fill_in :user_password_confirmation, with: "jillsecret"

    fill_in :user_email, with: "brenda@example.com"

    fill_in :user_phone, with: "4155555555"

    fill_in :state, with: "CA"
    fill_in :route, with: "Alley Lane"
    fill_in :street, with: "3"
    fill_in :zipcode, with: "94105"
    fill_in :city, with: "San Francisco"

    click_button "Sign up"

    expect(Address.last.street).to eq "3 Alley Lane"
  end
end
