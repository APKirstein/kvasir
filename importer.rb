# Domain region_id: 10000043
  @ids = {}
  @list = []

def db_connection
  begin
    connection = PG.connect(dbname: "kvasir_development")
    yield(connection)
  ensure
    connection.close
  end
end

def import_ids
  CSV.foreach('type_ids.csv', headers: true) do |row|
    @ids[row[0]] = row[1]
  end
end

def get_url
  feeds=HTTParty.get("http://api.eve-marketdata.com/api/item_prices2.json?char_name=NocturnalWinters&type_ids=34133&region_ids=10000043&buysell=a")

  feeds["emd"]["result"].each do |row|
    row.each do |key, value|
      @list << value
    end
  end
end

def list_items
  @list.each do |item|
    if @ids.has_key?(item["typeID"])
      item["name"] = @ids[item["typeID"]]
    end
  end
  return @list
end

def import_sql
  <<-SQL
  INSERT INTO markets(
    sale_type,
    regionid,
    typeid,
    price,
    info_date,
    name
  ) VALUES ($1, $2, $3, $4, $5, $6);
  SQL
end

def prepare_table
  <<-SQL
  TRUNCATE markets;
  SQL
end

def db_import
  import_ids
  get_url
  prepare_table
  import = []
  list_items.each do |item|
    import << item.values
  end
  db_connection do |conn|
    import.each do |line|
      conn.exec_params(import_sql, line)
    end
  end
end
