module Admin
  class ItemsController < ApplicationController
    before_filter :authorize_admin!
    def index
      @items = Item.all.page(params[:page])
    end

    def destroy
      @item = Item.find(params[:id])
      @item.destroy
      flash[:notice] = "Review has been deleted."
      redirect_to admin_items_path
    end
  end
end
