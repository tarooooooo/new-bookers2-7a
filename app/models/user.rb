class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  has_many :active_relationships, class_name: "Relationship", foreign_key: :followed_id
  has_many :followedes, through: :active_relationships, source: :follower

  has_many :passive_relationships, class_name: "Relationship",foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :followed

  attachment :profile_image

  validates :name, presence: true, length: {minimum: 2,maximum: 20} , uniqueness: true
  validates :introduction, length: { maximum: 50 }

  def liked_by?(book_id)
    self.favorites.where(book_id: book_id).exists?
  end

  def followed_by?(user)
     passive_relationships.find_by(followed_id: user.id).present?
  end
end