describe "user profile management" do
  it "lets users view their profiles" do
    user = create(:user)

    login_as(user)

    visit user_success_path

    click_button "View My Profile"

    expect(current_path).to eq edit_user_registration_path
  end
end