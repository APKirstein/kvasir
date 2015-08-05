class Items
  attr_reader :name, :buy_price, :sell_price, :region, :eve_type, :info_date

  def initialize(item)
    @name = item["name"]
    @buy_price = item["price"]
    @sell_price = item["s_price"]
    @region = item["regionID"]
    @eve_type = item["typeID"]
    @info_date = item["updated"]
  end
end
