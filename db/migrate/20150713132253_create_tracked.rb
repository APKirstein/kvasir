class CreateTracked < ActiveRecord::Migration
  def change
    create_table :trackeds do |t|
      t.belongs_to :user, null: false
      t.belongs_to :market, null: false
    end
  end
end
