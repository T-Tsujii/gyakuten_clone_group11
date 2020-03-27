class Solution < ApplicationRecord
  belongs_to :question
  validates :detail, presence: true
end
