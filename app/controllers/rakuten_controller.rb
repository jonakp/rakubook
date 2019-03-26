class RakutenController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:word]
      @word = params[:word]
      @items = RakutenWebService::Books::Book.search(title: @word) if @word.present?
    end
  end
end
