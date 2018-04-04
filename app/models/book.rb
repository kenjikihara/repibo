class Book < ApplicationRecord
  validates :title,  presence: true, length: { maximum: 30 }
  validates :content,  presence: true, length: { maximum: 300 }
  validates :image, presence: true
  validates :tag_list, presence: true
  
  belongs_to :user
  has_many :comments
  has_many :messages, dependent: :destroy
  has_many :message_users, through: :messages, source: :user
  
  mount_uploader :image, ImageUploader
  
  acts_as_taggable
  
  enum tag_list: {
                  vehicle: "vehicle",
                  food: "food",
                  words_numbers: "words_numbers",
                  creatures_body: "creatures_body",
                  funny: "funny",
                  wandering_melancholy: "wandering_melancholy",
                  thrilled_exciting: "thrilled_exciting",
                  scary_ghosts: "scary_ghosts",
                  science_wisdom: "science_wisdom",
                  old_story: "old_story",
                  }
end