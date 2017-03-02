describe "user profile management" do
  let(:user) { create(:user) }
  before :each do
    login_as(user)

    user.addresses.create({state: "CA", city: "San Francisco", street: "44 Happy Lane", zipcode: "94105"})
  end

  it "lets users view their profiles" do
    visit user_success_path

    click_button "View My Profile"

    expect(current_path).to eq edit_user_registration_path
  end

  it "lets users edit their profiles" do
    visit edit_user_registration_path

    fill_in :user_email, with: "brenda_new@example.com"

    fill_in :user_phone, with: "3375555555"

    fill_in :state, with: "CA"
    fill_in :route, with: "Alley Lane"
    fill_in :street, with: "5"
    fill_in :zipcode, with: "94105"
    fill_in :city, with: "San Francisco"

    click_button "Save"

    updated_user = User.find(user.id)

    expect(updated_user.email).to eq "brenda_new@example.com"
    expect(updated_user.phone).to eq "3375555555"

    expect(Address.last.street).to eq "5 Alley Lane"
  end

  it "does not change address if it is not modified" do
    visit edit_user_registration_path

    fill_in :user_email, with: "brenda_new@example.com"

    fill_in :user_phone, with: "3375555555"

    click_button "Save"

    expect(Address.last.street).to eq "44 Happy Lane"
  end
end