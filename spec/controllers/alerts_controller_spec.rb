describe AlertsController do
  it "returns list of all alerts" do
    create(:alert)

    get :index

    json = JSON.parse(response.body)

    expect(response.code).to eq "200"
    expect(json.length).to be 1
  end
end