require 'test_helper'

class ItemTest < ActiveSupport::TestCase

  test "the fixtures/rails model" do
    assert_equal 2, Item.count

    item = Item.first
    assert item.is_a?(Item)
    assert item.name
    assert item.description
    assert item.url
  end

  test "ignores url unless present" do
    item = Item.new(name: "name")
    assert item.valid?
  end

  test "validates present url" do
    item = Item.new(name: "name")
    item.url = "http://www.amazon.com"
    assert item.valid?
    item.url = "sdf"
    item.valid?
    assert item.errors.messages == {url: ["is invalid"]}
  end
end
