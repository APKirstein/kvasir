class CreateTracked < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.belongs_to :user, null: false
      t.belongs_to :market, null: false
    end
  end
end
