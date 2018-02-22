class Book < ApplicationRecord
  validates :title,  presence: true, length: { maximum: 30 }
  validates :content,  presence: true, length: { maximum: 200 }
  validates :image, presence: true
  validates :tag_list, presence: true
  
  belongs_to :user
  has_many :comments
  has_many :messages, dependent: :destroy
  has_many :message_users, through: :messages, source: :user
  
  mount_uploader :image, ImageUploader
  acts_as_taggable
end
