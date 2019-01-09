class Recipe < ApplicationRecord
  validates :user_id, presence: true
  validates :image, presence: true
  validates :title, presence: true, length:{maximum: 40}
  validates :cooking_material, presence: true
  validates :how_to_make, presence: true

  belongs_to :user
  has_many :like

  mount_uploader :image, ImageUploader
end
