namespace :items do
  desc "Generates market"
  task :parser => :environment do
    Parser.get_data
    Parser.seperate
    Parser.merge
    Parser.import_ids
    Parser.name_items
    @input = Parser.create_items
    @input.each do |item|
      Item.create(
      name: item.name,
      buy_price: item.buy_price,
      sell_price: item.sell_price,
      region: item.region,
      eve_type: item.eve_type,
      info_date: item.info_date )
    end
  end
end
