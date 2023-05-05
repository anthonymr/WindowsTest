class Product < ApplicationRecord
  has_one_attached :photo

  validates :title, :description, :price, presence: true
  validates :price, numericality: { greater_than: 0, less_than: 1000 }
  validates :title, uniqueness: true, length: { minimum: 5, maximum: 50 }
  validates :description, length: { minimum: 10, maximum: 200 }
end
