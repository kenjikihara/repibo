class Message < ApplicationRecord
  validates :name,  presence: true, length: { maximum: 30 }
  validates :content,  presence: true, length: { maximum: 300 }
  validates :email, presence: true, length: { maximum: 100 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_save { email.downcase! }
  
  belongs_to :user
  belongs_to :book
end
