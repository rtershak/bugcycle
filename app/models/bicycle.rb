class Bicycle < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :description, presence: true, length: { maximum: 1000 }

  mount_uploader :image, ImageUploader

  belongs_to :category
  belongs_to :user

  default_scope { order(created_at: :desc) }

  def self.search(param)
    if param
      where('name ILIKE ? OR description ILIKE ?', "%#{param}%", "%#{param}%")
    else
      all
    end
  end
end
