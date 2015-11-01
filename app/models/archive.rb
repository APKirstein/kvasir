class Archive < ActiveRecord::Base
  validates :name, presence: true
  validates :buy_price, presence: true
  validates :sell_price, presence: true
  validates :region, presence: true
  validates :eve_type, presence: true
  validates :info_date, presence: true

  include PgSearch
  pg_search_scope :search,
  against: :name,
  using: { tsearch: { prefix: true } }
end
