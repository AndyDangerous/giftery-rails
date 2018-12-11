class ItemBuilder
  def self.new_from_params(params)
    list = list_from_params(params)

    item = Item.new(params)
    item.lists << list if list
    item
  end

  private

  def self.list_from_params(params)
    list_id = params.delete('list_id').to_i
    if list_id > 0
      List.find(list_id)
    end
  end
end
