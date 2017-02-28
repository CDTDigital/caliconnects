describe "maps" do
  before :each do
    login_as(create(:user, admin: true))
  end

  it "shows a fire map" do
    visit admin_campaigns_path

    click_on "Fire"

    expect(page).to have_content "Fire"
  end

  it "shows a earthquake map" do
    visit admin_campaigns_path

    click_on "Earthquake"

    expect(page).to have_content "Earthquake"
  end

  it "shows a rivers map" do
    visit admin_campaigns_path

    click_on "River Gauge"

    expect(page).to have_content "River Gauge"
  end

  it "shows a tsunami map" do
    visit admin_campaigns_path

    click_on "Tsunami"

    expect(page).to have_content "Tsunami"
  end

  it "shows a weather hazards map" do
    visit admin_campaigns_path

    click_on "Weather Hazards"

    expect(page).to have_content "Weather Hazards"
  end
end