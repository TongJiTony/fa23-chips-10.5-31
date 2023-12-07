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
  def self.search_by_rep_issue(rep, issue, api_key = '6b82005868034242984854d7a6d1d028')
    default_uri = "https://newsapi.org/v2/everything?"
    uri = default_uri + "apiKey=" + api_key + "&q=" + rep.name + " AND " + issue

    response = Faraday.get(URI::escape(uri))
    response = JSON.parse(response.body)

    news_items = []
    results = response["results"]
  
    puts results

    count = 0
    if results.nil?
      return []
    end

    results.each do |result|
      news_item = {
        title: result["title"], 
        link: result["url"],
        description: result["content"],
      }
      news_items.push(news_item)
      count += 1
      if count == 5
        return news_items
      end
    end

    news_items
  end
end
