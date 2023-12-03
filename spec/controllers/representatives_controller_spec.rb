# frozen_string_literal: true

require 'rails_helper'

describe RepresentativesController do
  describe 'representatives' do
    it 'get all reps' do
      get :index
      expect(response).to render_template('index')
    end

    it 'get a id that is not valid' do
      allow(Representative).to receive(:exists?).and_return(false)
      get :show, params: { id: 1 }
      expect(response).to redirect_to(representatives_path)
    end

    it 'get a valid id' do
      # use factory to produce representative
      rep = create(:representative, title: 'rs', name: 'Tony')
      get :show, params: { id: rep.id }
      expect(response).to render_template('show')
    end
  end
end
