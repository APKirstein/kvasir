class TrackedItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :item

  validates :user_id, presence: true
  validates :item_id, presence: true

  validates_uniqueness_of :item_id, scope: :user_id
end
