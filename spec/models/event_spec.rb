# frozen_string_literal: true

require 'rails_helper'

describe Event do
  it 'gets county names by id' do
    @event = described_class.new(
      name: 'event', county_id: 1, start_time: '2025-01-01 00:00:00',
      end_time: '2026-01-01 00:00:00', created_at: '2022-01-01 00:00:00', updated_at: '2023-01-01 00:00:00'
    )
    expect(@event.county_names_by_id).to eq({})
  end
end
