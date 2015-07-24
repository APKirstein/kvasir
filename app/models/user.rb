class User < ActiveRecord::Base
  has_many :tracked_items
  has_many :items, through: :tracked_items

  validates :email, presence: true
  validates :username, presence: true, length: { minimum: 3 }

  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
