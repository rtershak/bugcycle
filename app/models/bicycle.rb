class Bicycle < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :description, presence: true, length: { maximum: 1000 }

  mount_uploader :image, ImageUploader

  belongs_to :category
  belongs_to :user

  has_many :suggestions

  default_scope { order(created_at: :desc) }

  def self.search(param, bicycles)
    if param
      bicycles.where('name ILIKE ? OR description ILIKE ?', "%#{param}%", "%#{param}%")
    else
      bicycles
    end
  end
end
