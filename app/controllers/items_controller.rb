class ItemsController < ApplicationController
  layout 'items_application'

  def index
    @items = Item.order("created_at").page
  end

end
