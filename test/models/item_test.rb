require 'test_helper'

class ItemTest < ActiveSupport::TestCase

  test "the fixtures/rails model" do
    assert_equal 2, Item.count

    item = Item.first
    assert item.is_a?(Item)
    assert item.name
    assert item.description
    assert item.url
    assert item.available?
  end
end
