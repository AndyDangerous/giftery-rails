require 'test_helper'

class ItemBuilderTest < ActiveSupport::TestCase
  test "builds new item from params with list_id" do
    params = {"name"=>"name", "description"=>"description", "url"=>"", "list_id"=>"1"}

    item = ItemBuilder.new_from_params(params)
    assert item.lists.first.id == 1
  end

  test "builds new item from params without list_id" do
    params = {"name"=>"name", "description"=>"description", "url"=>"", "list_id"=>"/"}

    item = ItemBuilder.new_from_params(params)
    assert item.lists.empty?
  end
end
