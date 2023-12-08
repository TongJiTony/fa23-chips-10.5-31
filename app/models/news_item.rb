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
  def self.search_by_rep_issue(rep, issue)
    api_key = '6b82005868034242984854d7a6d1d028'
    default_uri = 'https://newsapi.org/v2/everything?'

    # Use CGI.escape to properly encode query parameters
    escaped_api_key = CGI.escape(api_key)
    escaped_rep_name = CGI.escape(rep.name)
    escaped_issue = CGI.escape(issue)

    # Construct the URI with properly encoded query parameters
    uri = "#{default_uri}apiKey=#{escaped_api_key}&q=#{escaped_rep_name}+AND+#{escaped_issue}"

    results = get_response(uri)
    return nil if results.nil?

    produce_news_list(results)
  end

  def self.get_response(uri)
    # Make the HTTP GET request using Faraday
    response = Faraday.get(uri)
    response = JSON.parse(response.body)
    response['articles']
  end

  def self.produce_news_list(results)
    news_items = []
    count = 0

    results.each do |result|
      news_item = {
        title:       result['title'].slice(0..20),
        link:        result['url'],
        description: result['content'].slice(0..50)
      }
      news_items.push(news_item)
      count += 1
      return news_items if count == 5
    end
    return nil if count.zero?

    news_items
  end
end
