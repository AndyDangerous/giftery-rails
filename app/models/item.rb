class Item < ApplicationRecord
  has_and_belongs_to_many :lists

  validates :url, format: { with: URI.regexp }, allow_blank: true

  def available?
    available
  end

  def claim
    self.available = false
    save
  end
end
