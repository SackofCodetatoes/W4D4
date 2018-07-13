require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  # subject(:user) do
  #   FactoryBot.build(:user,
  #     email: "jonathan@fakesite.com",
  #     password: "good_password")
  #   end
  describe 'validations' do
    it 'should validate presence of email' do
      user = User.new(password: 'fiddy')
      expect(user.valid?).to be false
    end
      # it { should validate_presence_of(:email) }
      it { should validate_presence_of(:password_digest) }
      it { should validate_length_of(:password).is_at_least(8) }
  end
end
