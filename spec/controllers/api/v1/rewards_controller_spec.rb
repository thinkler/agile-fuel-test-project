require 'rails_helper'

RSpec.describe Api::V1::RewardsController, type: :controller do
  before(:all) { create_list(:reward, 10) }

  before(:each) do
    user = create(:user)
    auth_request(user)
  end

  describe 'GET index' do
    it 'returns filtered rewards' do
      get :index
      expect(response_body[:rewards].count).to eq(10)
    end
  end

  describe 'GET show' do
    it 'returns last reward' do
      get :show, params: { id: Reward.last.id }
      expect(response_body[:reward][:id]).to eq Reward.last.id
    end
  end
end
