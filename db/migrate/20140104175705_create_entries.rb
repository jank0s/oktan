class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :car_id
      t.date :date
      t.integer :odo
      t.float :quantity
      t.float :price

      t.timestamps
    end
  end
end
