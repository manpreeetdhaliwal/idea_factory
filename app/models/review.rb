class Review < ApplicationRecord
  belongs_to :idea
  # ASSOCIATION WITH USER MODEL
  belongs_to :user, optional: true
  validates :body, presence: {message: " should be present"}
end
