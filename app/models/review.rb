class Review < ApplicationRecord
  belongs_to :list
  validates :content, presence: true
  # Only integer
  validates :rating, numericality: {only_integer: true}
end
