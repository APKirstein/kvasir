class ItemsController < ApplicationController
  layout 'items_application'

  def index
    @items = Item.order(info_date: :DESC).page(params[:page])
    if params[:search]
      @items = Item.search(params[:search]).page(params[:page])
    else
      @items = Item.order(info_date: :ASC).page(params[:page])
    end
    @tracked_item = TrackedItem.new
  end

end
