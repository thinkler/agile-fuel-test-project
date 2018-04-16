require 'rails_helper'

RSpec.describe RewardsController do
  describe 'GET index' do
    before(:each) do
      user = create(:user)
      auth_request(user)
    end

    it 'renders index template' do
      get :index

      expect(response).to render_template('index')
    end
  end
end
