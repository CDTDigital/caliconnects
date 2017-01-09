describe HelloWorldController do
  it "returns a 200" do
    get :index

    expect(response.code).to eq("200")
  end
end