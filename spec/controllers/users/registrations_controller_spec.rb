describe Users::RegistrationsController do
  include Devise::Test::ControllerHelpers

  context "create" do
    it "creates addresses for the users" do
      @request.env["devise.mapping"] = Devise.mappings[:user]

      user_params = { user: { email: "test@example.com", password: "jillsecret" },
                      street: "425", route: "Market Street", city: "San Francisco", state: "CA", zipcode: "94105"}

      expect { post :create, params: user_params }.to change{ Address.count }.by(1)
    end
  end
end