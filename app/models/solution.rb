class Solution < ApplicationRecord
  belongs_to :question
  validates :s_answer, presence: true
end
