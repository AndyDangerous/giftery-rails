require 'test_helper'

class ListTest < ActiveSupport::TestCase
  test "a many to many relationship" do
    list = List.new
    item = list.items.new

    list.items.first == item
  end
end
