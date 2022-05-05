class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, length: { minimum: 6 }
  # validates :movie, uniqueness: true
  # validates :list, uniqueness: true

  validates :movie_id, uniqueness: {scope: :list_id, message: "ya está en la lista"}
end
