# Domain region_id: 10000043
require "csv"
require "HTTParty"
require "pry"

class MarketUpdate
    @ids = {}
    @list = []

  def get_url
    feeds=HTTParty.get("http://api.eve-marketdata.com/api/item_prices2.json?char_name=NocturnalWinters&type_ids=&region_ids=10000043&buysell=a")

    feeds["emd"]["result"].each do |row|
      # binding.pry
      row.each do |key, value|
        @list << [value["buysell"], value["typeID"], value["price"], value["updated"]]
      end
    end
    update
  end

  def update
    # binding.pry
    @list.each do |item|
      Market.where(sale_type: item[0], id: item[1]).update_all(price: item[2], info_date: item[3])
    end
  end
end
