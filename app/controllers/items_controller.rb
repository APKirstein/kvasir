require "pry-byebug"
class ItemsController < ApplicationController
  layout 'items_application'

  def index
    @items = Item.order(info_date: :DESC).page(params[:page])
    @tracked_item = TrackedItem.new
  end

  def show
    if params[:search]
      @item = Item.search(params[:search]).page(params[:page])
    else
      @item = Item.order(info_date: :ASC).page(params[:page])
    end
  end

end
