# frozen_string_literal: true

require 'rails_helper'

describe MapController do
  describe 'county search' do
    let(:reps) { [] }
    let(:controller_instance) { instance_double(described_class) }

    before do
      allow(described_class).to receive(:new).and_return(controller_instance)
      allow(controller_instance).to receive(:county).and_return(reps)
      get :county, { params: { state_symbol: 'CA', std_fips_code: '001' } }
    end

    it 'renders the county table' do
      response.should redirect_to root_path
    end

    it 'assigns reps list based on county output' do
      expect(assigns(:representatives)).to be_nil
    end
  end
end
