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

  test "builds new item from params with list_id" do
    params = {"name"=>"name", "description"=>"description", "url"=>"", "list_id"=>"1"}

    item = Item.new_from_params(params)
    assert item.lists.first.id == 1
  end

  test "builds new item from params without list_id" do
    params = {"name"=>"name", "description"=>"description", "url"=>"", "list_id"=>"/"}

    item = Item.new_from_params(params)
    assert item.lists.empty?
  end
end
