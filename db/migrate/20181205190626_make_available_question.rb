class MakeAvailableQuestion < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :available?, :available
  end
end
