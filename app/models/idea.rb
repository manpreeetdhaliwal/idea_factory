class Idea < ApplicationRecord
     # ASSOCIATION WITH IDEA MODEL
     has_many :reviews, dependent: :destroy # in case of delete
     # ASSOCIATION WITH USER MODEL
     belongs_to :user, optional: true
    validates :title, presence: true, uniqueness:true
    validates :description, presence: true, length: {minimum: 15}
end
