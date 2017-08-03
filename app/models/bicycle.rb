class Bicycle < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :description, presence: true, length: { maximum: 500 }

  belongs_to :category
  belongs_to :user
end
