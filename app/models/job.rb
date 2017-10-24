class Job < ApplicationRecord
  validates :title, presence: true
  validates :wage_upper_bound, presence: true
  validates :wage_down_bound, presence: true
  validates :wage_down_bound, numericality: { greater_than: 0}
end
