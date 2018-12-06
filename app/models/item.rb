class Item < ApplicationRecord
  has_and_belongs_to_many :lists

  validates :name, presence: true
  validates :url, format: { with: URI.regexp }, allow_blank: true

  def self.new_from_params(params)
    list = list_from_params(params)

    item = new(params)
    item.lists << list if list
    item
  end

  def available?
    available
  end

  def claim
    self.available = false
    save
  end

  private

  def self.list_from_params(params)
    list_id = params.delete('list_id').to_i
    if list_id > 0
      List.find(list_id)
    end
  end
end
