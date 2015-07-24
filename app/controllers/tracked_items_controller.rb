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
      user: User.find(params[:user].to_i),
      item: Item.find(params[:item].to_i)
    )
    respond_to do |format|
      if @tracked_item.save
        format.html { redirect_to :back, notice: "Item added to my items" }
        format.json { render json: @tracked_item }
      else
        format.html { redirect_to :back }
        format.json { render json: @tracked_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tracked_item = TrackedItem.find(params[:id])
    @tracked_item.destroy
    flash[:notice] = "Successfully deleted #{@tracked_item.item.name}!"
    redirect_to tracked_items_path
  end

  protected

  def tracked_params
    params.require(:tracked_item).permit(:item, :user)
  end
end
