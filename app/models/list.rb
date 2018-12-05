class List < ApplicationRecord
  has_and_belongs_to_many :items
  belongs_to :user
  belongs_to :group

  def items_ordered_by_availability
    items.sort_by{|i| i.available? ? 0 : 1}
  end
end
