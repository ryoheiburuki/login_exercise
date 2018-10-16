class User < ApplicationRecord
  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation {email.downcase!}
  has_secure_password
  validates :password_digest, presence: true, length: {minimum: 8}
  has_many :blogs
  has_many :favorites, dependent: :destroy
  #destroyオプション：紐付いているユーザーが削除されたらfavoriteも削除する
  has_many :favorite_blogs, through: :favorites, source: :blog
end
