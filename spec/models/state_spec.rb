# frozen_string_literal: true

require 'rails_helper'

describe State do
  it 'standardizes FIPS' do
    @state = described_class.new(
      name: 'test', symbol: 'CA', fips_code: 6, is_territory: 1, lat_min: 0.0, lat_max: 1.0, long_min: 0.0,
      long_max: 1.0, created_at: '2010-01-01 00:00:00:', updated_at: '2011-01-01 00:00:00'
    )
    expect(@state.std_fips_code).to eq('06')
  end
end
