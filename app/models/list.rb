class List < ApplicationRecord
  has_and_belongs_to_many :items
  belongs_to :user
  belongs_to :group
end
