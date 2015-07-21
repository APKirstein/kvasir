class TrackedItemsController < ApplicationController
  layout "items_application"
  before_action :authenticate_user!

  def index
    @tracked_items = TrackedItem.where(user_id: current_user).page
  end

  def show
    @tracked = TrackedItem.find(params[:item_id])
  end

  def create
    @tracked_item = TrackedItem.new(
    user: User.find(params[:tracked_item][:user]),
    item: Item.find(params[:tracked_item][:item])
    )
    respond_to do |format|
      if @tracked_item.save
        flash[:notice] = "Item added to my items"
          format.html { redirect_to items_path}
          format.json { render }
      else
        flash[:notice] = "There was an error, please consult your admin"
      end
    end
  end

  protected

  def tracked_params
    params.require(:tracked_item).permit(:item, :user)
  end

end
