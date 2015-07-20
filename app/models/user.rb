class User < ActiveRecord::Base
  has_many :items

  validates :email, presence: true
  validates :username, presence: true, length: { minimum: 3 }

  mount_uploader :avatars, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
