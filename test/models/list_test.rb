require 'test_helper'

class ListTest < ActiveSupport::TestCase
  test "a many to many relationship" do
    list = List.new
    item = list.items.new

    list.items.first == item
  end

  test "fixtures, I guess" do
    list  = List.first

    assert list.user.is_a? User
    assert list.group.is_a? Group
    assert list.items.first.is_a? Item
  end
end
