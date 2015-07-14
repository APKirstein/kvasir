class Item < ActiveRecord::Base
  has_many :users

  validates :name, presence: true
  validates :buy_price, presence: true
  validates :sell_price, presence: true
  validates :region, presence: true
  validates :type, presence: true
  validates :info_date, presence: true
end
