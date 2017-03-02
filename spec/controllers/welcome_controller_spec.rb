describe WelcomeController do
  context "preparedness" do
    let(:alert) { create(:alert) }

    it "records visits on the related alert" do
      initial_total = alert.opened_total

      get :preparedness, params: { id: alert.id }

      new_total = Alert.find(alert.id).opened_total

      expect(new_total - initial_total).to eq 1
    end
  end

  context "index" do
    it "redirects an admin to the admin section" do
      admin = create(:user, admin: true)

      sign_in admin

      get :index

      expect(response).to redirect_to admin_campaigns_path
    end

    it "redirects a normal user to their profile" do
      user = create(:user)

      sign_in user

      get :index

      expect(response).to redirect_to edit_user_registration_path
    end
  end
end