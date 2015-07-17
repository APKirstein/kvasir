class CreateTrackedItems < ActiveRecord::Migration
  def change
    create_table :tracked_items do |t|
      t.belongs_to :user, null: false
      t.belongs_to :item, null: false
    end
  end
end
