require 'rails_helper'

RSpec.describe Rent, type: :model do

  describe 'Validations' do
    it { should validate_presence_of :status }
  end

  describe "Associations" do
    it { should belong_to(:home) }
    it { should belong_to(:user) }
  end
end
