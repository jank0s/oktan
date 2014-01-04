class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.integer :model_id
      t.integer :user_id
      t.integer :year
      t.integer :power
      t.integer :fuel_type_id

      t.timestamps
    end
  end
end
