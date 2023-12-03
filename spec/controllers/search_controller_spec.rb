# frozen_string_literal: true

require 'rails_helper'

describe SearchController do
  describe 'search representatives' do
    let(:reps) { [] }

    it 'redirects with empty address' do
      get :search
      expect(response).to redirect_to('/representatives')
    end

    it 'renders search template with common address' do
      get :search, params: { address: 'CA' }
      expect(response).to render_template('representatives/search')
    end
  end
end
