class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates :comment, presence: true, length: { minimum: 6, message: "Check it, might be more or less than 6" }
  # validates_uniqueness_of :movie_id, scope: :list_id
  # validates :movie, presence: true, uniqueness: {scope: :list}
  validates :movie_id, presence: true, uniqueness: {scope: :list_id, message: 'is already in the list'}
end
