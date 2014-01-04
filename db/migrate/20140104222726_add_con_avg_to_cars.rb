class AddConAvgToCars < ActiveRecord::Migration
  def change
    add_column :cars, :con_avg, :float
  end
end
