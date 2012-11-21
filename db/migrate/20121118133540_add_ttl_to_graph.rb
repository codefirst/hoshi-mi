class AddTtlToGraph < ActiveRecord::Migration
  def change
    add_column :graphs, :ttl, :integer, :default => 1_000
  end
end
