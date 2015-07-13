class Market < ActiveRecord::Base
  validates :sale_type, presence: true, format: { with: /[bs]/}
  validates :name, presence: true
  validates :regionid, presence: true
  validates :typeid, presence: true
  validates :price, presence: true
  validates :info_date, presence: true
end
