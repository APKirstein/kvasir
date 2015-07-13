class MarketsController < ApplicationController
  layout 'markets_application'

  def index
    @items = {}
    @sale_items = Market.where(sale_type: "s").page
    @buy_items = Market.where(sale_type: "b").page

    @sale_items.each do |sell|
      @items[sell.name] = [sell]
    end

    @buy_items.each do |buy|
      if @items.has_key?(buy.name)
        @items[buy.name] << buy
      end
    end
  end
  
end
