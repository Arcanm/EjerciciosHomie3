require 'rails_helper'

RSpec.describe Home, type: :model do
  let!(:home){FactoryBot.create(:home)}

  describe 'Validations' do
    it { should validate_presence_of :price }
    it { should validate_presence_of :extra_service }
    it { should validate_presence_of :total_amount }
    it { should validate_presence_of :home_features }
    it { should validate_presence_of :status }
  end

  describe "Associations" do
    it { should have_many(:rents) }
    it { should belong_to(:owner) }
  end
end
