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
end