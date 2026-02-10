class List < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :image_url, presence: true

  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
end
