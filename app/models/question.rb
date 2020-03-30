class Question < ApplicationRecord
  has_many :solutions
  validates :title, presence: true
  validates :detail, presence: true
end
