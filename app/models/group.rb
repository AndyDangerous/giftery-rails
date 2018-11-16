class Group < ApplicationRecord
  has_many :lists

  validates :name, presence: true

  def user_lists
    lists.map do |list|
      UserList.new(list)
    end
  end
end
