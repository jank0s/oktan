class AddKmToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :km, :float
  end
end
