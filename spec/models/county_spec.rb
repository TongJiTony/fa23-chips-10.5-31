# frozen_string_literal: true

require 'rails_helper'

describe County do
  it 'standardizes FIPS' do
    @county = described_class.new(
      name:       'test', state_id:   1, fips_code:  1, fips_class: 'test',
      created_at: '2010-01-01 00:00:00', updated_at: '2011-01-01 00:00:00'
    )
    expect(@county.std_fips_code).to eq('001')
  end
end
