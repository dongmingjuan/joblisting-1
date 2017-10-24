class Job < ApplicationRecord
  validates :title, presence: true
  validates :wage_upper_bound, presence: true
  validates :wage_down_bound, presence: true
  validates :wage_down_bound, numericality: { greater_than: 0}
  def open!
    self.is_hidden = false
    self.save
  end
  def close!
    self.is_hidden = true
    self.save
  end
end
