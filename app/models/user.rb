class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :tools, dependent: :destroy

  validates :avatar,
            content_type: %w[image/jpeg image/png],
            size: { less_than: 2.megabytes, message: "taille maximale 2 MB" }
  validates :name, presence: true, length: { maximum: 50 }, on: :update
  validates :bio, length: { maximum: 240 }, on: :update
  validates :street, presence: true, on: :update
  validates :city, presence: true, on: :update
  validates :post_code, presence: true, on: :update

  # Geocoding
  geocoded_by :address
  after_validation :geocode

  private

  def address
    [street, city, post_code, country].compact.join(', ')
  end
end
