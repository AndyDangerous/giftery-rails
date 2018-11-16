require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  test "groups have lists" do
    group = Group.first

    assert group.lists.length == 2
  end
end
