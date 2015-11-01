class ArchiveController < ApplicationController
  layout 'items_application'

  def index
    @items = Archive.order(info_date: :DESC).page(params[:page])
    if params[:search]
      @items = Archive.order(params[:search]).page(params[:page])
    end
    @tracked_item = TrackedItem.new
  end
end
