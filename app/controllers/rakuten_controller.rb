class RakutenController < ApplicationController
  def index
    @items = RakutenWebService::Books::Book.search(title: 'Ruby')
  end

  def book_search
    render 'index'
  end
end
