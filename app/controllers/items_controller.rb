require "pry-byebug"
class ItemsController < ApplicationController
  layout 'items_application'

  def index
    # binding.pry
    @items = Item.order("created_at").page
  end

end
