require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:tracks) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }

  describe 'creation' do
    let!(:user) { FactoryBot.create(:user) }
    it 'can be created' do
      expect(user).to be_valid
    end
  end

  describe 'validations' do
    let(:user) { FactoryBot.build(:user) }
    let(:duplicate_user) { FactoryBot.build(:user) }

    it 'must have an email' do
      user.email = nil
      expect(user).to_not be_valid
    end

    it 'must have unique email' do
      user.save!
      duplicate_user.email = user.email
      expect(duplicate_user).to_not be_valid
    end

    it 'must have a password' do
      user.password = nil
      expect(user).to_not be_valid
    end

    it 'has tracks association' do
      should respond_to(:tracks)
    end
  end
end
