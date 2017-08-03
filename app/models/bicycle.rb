class Bicycle < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :description, presence: true, length: { maximum: 500 }

  mount_uploader :image, ImageUploader

  belongs_to :category
  belongs_to :user

  def image_url
    self.image.present? ? self.image.face : 'default-bicycle.jpg'
  end
end
