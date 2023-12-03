# frozen_string_literal: true

# spec/factories/news_items.rb
# written by Zixun Huang

FactoryBot.define do
  factory :news_item do
    # Define attributes for the news_items
    title { 'fake title' }
    link { 'fake link' }
    description { 'fake description' }
    representative_id { 1 }
    issue { 'fake issue' }
  end
end
