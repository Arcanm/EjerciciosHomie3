require 'rails_helper'

describe Homes::SimilarHome do
  let!(:owner) { FactoryBot.create(:owner) }
  let(:params) do
    {
      price: 4500.99,
      extra_service: 50.80,
      home_features: { garden: false, furnished: true, gym: true },
      owner: owner
    }
  end
  let!(:home1) { FactoryBot.create(:home, params) }
  let!(:home2) { FactoryBot.create(:home, params) }
  let!(:home3) { FactoryBot.create(:home) }

  context '.call' do
    it 'find similar homes' do
      similar_list_ctx = []
      similar_list = [home1.id, home2.id]
      similar_home_ctx = ::Homes::SimilarHome.call
      similar_home_ctx.coincidences_of_home.map do |home|
        similar_list_ctx << home[:id_home]
      end
      expect(similar_home_ctx).to be_a_success
      expect(similar_list_ctx).to eq(similar_list)
      expect(similar_home_ctx.coincidences_of_home.size).to eq(2)
    end
  end
end