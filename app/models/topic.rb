class Topic < ApplicationRecord
  validates :user_id, presence: true
  validates :description, presence:true, length:{maximum: 300}
  validates :title, presence: true, length:{maximum: 40}

  belongs_to :user
  has_many :comments

  mount_uploader :image, ImageUploader
end
