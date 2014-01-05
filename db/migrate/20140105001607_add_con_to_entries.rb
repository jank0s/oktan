class AddConToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :con, :float
  end
end
