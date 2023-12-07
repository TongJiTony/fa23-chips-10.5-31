# frozen_string_literal: true

class NewsItem < ApplicationRecord
  belongs_to :representative
  has_many :ratings, dependent: :delete_all

  def self.find_for(representative_id)
    NewsItem.find_by(
      representative_id: representative_id
    )
  end

  # given representative and issue, using name and issue as keywords
  # calling news api to get the top 5
  # and return as a list of news items
  def self.search_by_rep_issue(rep, issue, api_key='6b82005868034242984854d7a6d1d028')
    
    default_uri = 'https://newsapi.org/v2/everything?'

    # Use CGI.escape to properly encode query parameters
    escaped_api_key = CGI.escape(api_key)
    escaped_rep_name = CGI.escape(rep.name)
    escaped_issue = CGI.escape(issue)

    # Construct the URI with properly encoded query parameters
    uri = "#{default_uri}apiKey=#{escaped_api_key}&q=#{escaped_rep_name}+AND+#{escaped_issue}"

    # Make the HTTP GET request using Faraday
    response = Faraday.get(uri)
    response = JSON.parse(response.body)

    news_items = []
    results = response['articles']

    count = 0
    return nil if results.nil?

    results.each do |result|
      news_item = {
        title:       result['title'],
        link:        result['url'],
        description: result['content'].slice(0..30)
      }
      news_items.push(news_item)
      count += 1
      return news_items if count == 5
    end
    if count == 0
      return nil
    end

    puts news_items
    news_items
  end
end
