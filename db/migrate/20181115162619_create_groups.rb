class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name

      t.timestamps
    end

    change_table :lists do |t|
      t.references :group, foreign_key: true
    end
  end
end
