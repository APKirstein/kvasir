# Domain region_id: 10000043
# require "csv"
# require "HTTParty"
# require "pry"

class Items
  attr_reader :name, :buy_price, :sell_price, :region, :eve_type, :info_date

  def initialize(item)
    @name = item["name"]
    @buy_price = item["price"]
    @sell_price = item["s_price"]
    @region = item["regionID"]
    @eve_type = item["typeID"]
    @info_date = item["updated"]
    # @kvasir = index
  end

  # def index
  #   (item["s_price"] - item["price"])
  # end

end
