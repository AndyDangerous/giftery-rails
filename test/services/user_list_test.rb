require 'test_helper'

class UserListTest < ActiveSupport::TestCase
  test "#user_name" do
    user = User.first
    user_name = user.name
    list = user.lists.first

    assert_equal UserList.new(list).user_name, user_name
  end

  test "#list_id" do
    user = User.first
    list = user.lists.first
    list_id = list.id

    assert_equal UserList.new(list).list_id, list_id
  end
end
