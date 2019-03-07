class SearchController < ApplicationController
  def index
    @items = RakutenWebService::Books::Book.search(title: 'Ruby')
  end
end
