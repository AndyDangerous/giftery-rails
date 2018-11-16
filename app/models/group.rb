class Group < ApplicationRecord
  has_many :lists

  validates :name, presence: true

  def user_lists(except: nil)
    lists_without_user(user: except).map do |list|
      UserList.new(list)
    end
  end

  private

  def lists_without_user(user: nil)
    return lists if user.nil?
    lists.reject do |list|
      list.user == user
    end
  end
end
