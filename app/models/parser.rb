# require "httparty"
# require "pry-byebug"
# require "csv"
require_relative "marketize"

module Parser

  class << self
    attr_accessor :market, :list

    def initialize(market=10000034)
      @market = market
      @list = []
      @buy_list = []
      @sell_list = []
      @ids = {}
    end

    def get_data
      @list = Array.new
      feeds = HTTParty.get("http://api.eve-marketdata.com/api/item_prices2.json?char_name=NocturnalWinters&type_ids=34133&region_ids=#{@market}&buysell=a")

      feeds["emd"]["result"].each do |row|
        row.each do |key, value|
          @list << value
        end
      end
      return @list
    end

    def seperate
      @buy_list = Array.new
      @sell_list = Array.new
      @list.each do |item|
        if item["buysell"] == "s"
          @sell_list << item
        else
          @buy_list << item
        end
      end
    end

    def merge
      @sell_list.each do |s|
        @buy_list.each do |b|
          if b["typeID"] == s["typeID"]
            b["s_price"] = s["price"]
          end
        end
      end
      @list.replace(@buy_list)
      return @list
    end

    def import_ids
      @ids = Hash.new
      CSV.foreach("lib/assets/type_ids.csv", headers: true) do |row|
        @ids[row[0]] = row[1]
      end
    end

    def name_items
      @list.each do |item|
        if @ids.has_key?(item["typeID"])
          item["name"] = @ids[item["typeID"]]
        end
      end
      return @list
    end

    def create_items
      list = []
      @list.each do |item|
        list << Items.new(item)
      end
      @list.replace(list)
      return @list
    end

  end
end
