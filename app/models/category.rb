class Category < ApplicationRecord
  has_many :articles, dependent: :restrict_with_error
  validates :name, presence: true, length: { minimum: 3 }, uniqueness: { case_sensitive: false }

  scope :name_order, -> { order(name: :asc) }
end
