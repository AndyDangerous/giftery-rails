require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  test "groups have lists" do
    group = Group.first

    assert group.lists.length == 2
  end

  test "groups have user_lists" do
    user_list = Group.first.user_lists.first
    assert user_list.user_name
    assert user_list.list_id
  end
end
