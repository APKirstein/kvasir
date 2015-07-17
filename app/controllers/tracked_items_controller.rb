class TrackedItemsController < ApplicationController
  layout 'items_application'
  before_action :authenticate_user!

  def index
    @tracked_items = TrackedItem.where(user_id: params[:id]).page
  end

  def show
    @tracked = TrackedItem.find(params[:item_id])
  end

end
