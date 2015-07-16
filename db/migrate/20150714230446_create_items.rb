class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.float :buy_price, null: false
      t.float :sell_price, null: false
      t.integer :region, null: false
      t.integer :eve_type, null: false
      t.datetime :info_date, null: false

      t.timestamps null: false
    end
  end
end
