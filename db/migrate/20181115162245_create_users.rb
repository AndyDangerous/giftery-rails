class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name

      t.timestamps
    end

    change_table :lists do |t|
      t.references :user, foreign_key: true
    end
  end
end
