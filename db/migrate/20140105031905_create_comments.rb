class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :car_id
      t.string :value

      t.timestamps
    end
  end
end
