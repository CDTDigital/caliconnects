describe User do
  describe 'user information' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:phone) }
    it { should validate_length_of(:phone).is_equal_to(10) }
  end
end
