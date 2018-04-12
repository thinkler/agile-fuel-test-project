require 'rails_helper'

RSpec.describe Api::V1::RewardsController, type: :controller do
  describe 'GET index' do

    let(:user) { create(:user) }

    before(:all) do
      create_list(:reward, 25, user: create(:user))
      create_list(:reward, 25, status: 'approved', user: create(:user))
    end
    before(:each) { get :index, params: params }

    context 'without params' do
      let(:params) do
        {}
      end

      it 'returns rewards' do
        expect(response_body.count).to eq(20)
      end
    end

    context 'with filter params' do
      let(:params) do
        { filters: { status: 'approved' } }
      end

      it 'returns rewards' do
        expect(response_body.pluck(:status)).to all be == 'approved'
      end
    end

    context 'with order params' do
      let(:params) do
        { order: '-id' }
      end

      it 'returns rewards' do
        first_reward = response_body[0]
        second_reward = response_body[1]
        expect(first_reward[:id]).to be > second_reward[:id]
      end
    end

    context 'with pagination params' do
      let(:params) do
        { page: 1, per_page: 50 }
      end

      it 'returns rewards' do
        expect(response_body.count).to eq(50)
      end
    end

    context 'with mixed params' do
      let(:params) do
        { filters: { status: 'approved'}, order: '-id', page: 1, per_page: 10 }
      end

      it 'returns rewards' do
        first_reward = response_body[0]
        second_reward = response_body[1]

        expect(first_reward[:id]).to be > second_reward[:id]
        expect(response_body.pluck(:status)).to all be == 'approved'
        expect(response_body.count).to eq(10)
      end
    end
  end
end
