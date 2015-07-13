class Item < ActiveRecord::Base
  belongs_to :User
  belongs_to :Market

  validates :user_id, presence: true
  validates :market_id, presence: true
end
