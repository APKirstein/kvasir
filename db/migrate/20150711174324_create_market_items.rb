class CreateMarketItems < ActiveRecord::Migration
  def change
    create_table :markets do |t|
      t.string  "sale_type", null: false
      t.string  "name",      null: false
      t.integer "regionid", null: false
      t.integer "typeid",   null: false
      t.float   "price",     null: false
      t.date    "info_date", null: false
    end
  end
end
