describe "admin sign in" do
  let(:admin) { create(:user, admin: true) }

  it "redirects the admin to their landing page on login" do
    visit root_path

    click_button "Login"

    fill_in :user_email, with: admin.email
    fill_in :user_password, with: admin.password

    click_button "Login"

    expect(current_path).to eq admin_campaigns_path
  end
end