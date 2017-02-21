describe DisasterEventsController do
  it "returns earthquake events" do
    get :earthquakes

    expect(response.code).to eq("200")
  end

  it "returns fire events" do
    get :fires

    expect(response.code).to eq("200")
  end

  it "returns river events" do
    get :rivers

    expect(response.code).to eq("200")
  end

  it "returns tsunami events" do
    get :tsunami

    expect(response.code).to eq("200")
  end

  it "returns weather events" do
    get :weather

    expect(response.code).to eq("200")
  end
end