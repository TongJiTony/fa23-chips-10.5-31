# frozen_string_literal: true

# spec/factories/representatives.rb
# written by Zixun Huang

FactoryBot.define do
  factory :representative do
    # Define attributes for the representative
    name { 'Fake name' }
    title { 'A fake title' }
    party { 'fake party' }
    photo_url { 'http://fake.com' }
    city { 'fake city' }
    street_address { 'fake street' }
    state { 'fake state' }
    zip { 'fake zip' }
  end
end
