require 'rails_helper'

RSpec.describe Filterable do
  let(:collection) { Reward.filter(params) }

  before(:all) do
    @user = create(:user)
    create_list(:reward, 10, status: 'redeemed')
    create_list(:reward, 5, status: 'approved')
    create_list(:reward, 5, status: 'approved', user: @user)
  end

  describe '#filter' do
    context 'with valid params' do
      context 'with filters params' do
        let(:params) do
          { status: 'approved', user_id: @user.id }
        end

        it 'returns filtered collection' do
          expect(collection.count).to eq(5)
          expect(collection.pluck(:status)).to all be == 'approved'
          expect(collection.pluck(:user_id)).to all be == @user.id
        end
      end

      context 'with order param' do
        let(:params) do
          { order: '-id' }
        end

        it 'returns filtered collection' do
          first_record = collection.first
          second_record = collection.second

          expect(first_record[:id]).to be > second_record[:id]
        end
      end

      context 'with filters and order params' do
        let(:params) do
          { status: 'approved', order: '-id' }
        end

        it 'returns filtered collection' do
          first_record = collection.first
          second_record = collection.second

          expect(first_record[:id]).to be > second_record[:id]
          expect(collection.count).to eq(10)
          expect(collection.pluck(:status)).to all be == 'approved'
        end
      end
    end

    context 'without params' do
      let(:params) do
        {}
      end

      it 'returns unchanged collection' do
        expect(collection.count).to eq(20)
      end
    end
  end
end
