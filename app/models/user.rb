class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  validates :avatar,
            content_type: %w[image/jpeg image/png],
            size: { less_than: 2.megabytes, message: "must be under 2 MB" },
            limit: { max: 1 }
  validates :name, presence: true, length: { maximum: 50 }
  validates :bio, length: { maximum: 240 }
  validates :street, presence: true
  validates :city, presence: true
  validates :post_code, presence: true
end
