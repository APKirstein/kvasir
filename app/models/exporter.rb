module Exporter

  class << self
    attr_accessor :time

    def import
      items = Item.where('created_at >= :hour_ago', :hour_ago => Time.now - 1.hour)

      items.each do |item|
        Archive.create(
          name: item.name,
          buy_price: item.buy_price,
          sell_price: item.sell_price,
          region: item.region,
          eve_type: item.eve_type,
          info_date: item.info_date
        )
      end
    end

    def remake
      Item.delete_all
    end

  end

end
