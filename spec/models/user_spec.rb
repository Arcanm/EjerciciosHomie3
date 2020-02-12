require 'rails_helper'

RSpec.describe User, type: :model do

  let!(:user){FactoryBot.create(:user)}

  describe 'Validations' do
    context 'Name' do
      it 'Must be present' do
        user.name = nil 
        expect(user).to_not be_valid
      end
    end

    context 'Last Name' do
      it 'Must be present' do
        user.last_name = nil 
        expect(user).to_not be_valid
      end
    end

    context 'Email' do
      it 'Must be present' do
        user.email = nil 
        expect(user).to_not be_valid
      end
    end

    context 'Mobile Phone' do
      it 'Must be present' do
        user.mobile_phone = nil 
        expect(user).to_not be_valid
      end
    end

    context 'Work Place' do
      it 'Must be present' do
        user.work_place = nil 
        expect(user).to_not be_valid
      end
    end
  end

  describe "Associations" do
    it { should have_many(:rents)}
  end
end