# frozen_string_literal: true

require 'rails_helper'

require 'google/apis/civicinfo_v2'

describe NewsItem do
  it 'search news of a representative' do
    items = described_class.find_for(3)
    expect(items).to be_nil
  end
end
