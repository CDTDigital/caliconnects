FactoryGirl.define do
  factory :alert do
    campaign_id 1
    description "MyText"
    severity "voluntary_evacuation"
  end
end
