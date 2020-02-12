require 'rails_helper'

RSpec.describe Owner, type: :model do

  let!(:owner){FactoryBot.create(:owner)}
  
  describe 'Validations' do

    context 'Curp' do
      it 'Must be present' do
        owner.curp = nil 
        expect(owner).to_not be_valid
      end
    end

    context 'Registred Sr Pago' do
      it 'Must be present' do
        owner.registered_in_srpago = nil 
        expect(owner).to_not be_valid
      end
    end
  end

  describe "Associations" do
    it { should belong_to(:user) }
    it { should have_many(:homes) }
  end
end