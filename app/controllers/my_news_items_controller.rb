# frozen_string_literal: true

class MyNewsItemsController < SessionController
  before_action :set_representative
  before_action :set_representatives_list
  before_action :set_news_item, only: %i[edit update destroy]

  # action for news search based on representative and issue
  def search
    @representative_id = params[:rep_id]
    @representative = Representative.find(@representative_id)
    @issue = params[:issue]
    @news_item = NewsItem.new
    @news_list = NewsItem.search_by_rep_issue(@representative, @issue)
    if @news_list.nil?
      render :new, error: 'No news found with these params'
    end
    session[:news_list] = @news_list
  end

  def new; end

  def edit; end

  def create
    @news_item = NewsItem.new(news_item_params)
    news_index = params[:selected_news].to_i
    news_list = session[:news_list]

    @news_item.title=news_list[news_index]["title"] 
    @news_item.description=news_list[news_index]["description"]
    @news_item.link=news_list[news_index]["link"]

    if @news_item.save
      redirect_to representative_news_item_path(@representative, @news_item),
                  notice: 'News item was successfully created.'
    else
      render :new, error: 'An error occurred when creating the news item.'
    end
    session[:news_list] = nil
  end

  def update
    if @news_item.update(news_item_params)
      redirect_to representative_news_item_path(@representative, @news_item),
                  notice: 'News item was successfully updated.'
    else
      render :edit, error: 'An error occurred when updating the news item.'
    end
  end

  def destroy
    @news_item.destroy
    redirect_to representative_news_items_path(@representative),
                notice: 'News was successfully destroyed.'
  end

  private

  def set_representative
    @representative = Representative.find(
      params[:representative_id]
    )
  end

  def set_representatives_list
    @representatives_list = Representative.all.map { |r| [r.name, r.id] }
  end

  def set_news_item
    @news_item = NewsItem.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def news_item_params
    params.require(:news_item).permit(:news, :title, :description, :link, :representative_id, :issue, :rating)
  end
end
