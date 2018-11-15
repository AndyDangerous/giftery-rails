class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|

      t.timestamps
    end

    create_table :items_lists do |t|
      t.belongs_to :item, index: true
      t.belongs_to :list, index: true
    end
  end
end
