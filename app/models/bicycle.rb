class Bicycle < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :description, presence: true, length: { maximum: 1000 }

  mount_uploader :image, ImageUploader

  belongs_to :category
  belongs_to :user
end
