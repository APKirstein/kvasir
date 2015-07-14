class ItemsController < ApplicationController
  layout 'markets_application'

  def index
    @items = Market.order("typeid").page
  end

end
