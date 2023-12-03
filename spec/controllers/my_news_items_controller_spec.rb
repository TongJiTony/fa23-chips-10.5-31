# frozen_string_literal: true

require 'rails_helper'

describe MyNewsItemsController do
  describe 'news_item' do
    before do
      @rep = create(:representative)
      @news = create(:news_item, title: 'fire_test', representative_id: 1, issue: 'racism')
    end

    it 'create a new item' do
      news_params = { title: 'fire_test', representative_id: 3, issue: 'racism' }
      post :create, params: news_params
    end
  end
end
