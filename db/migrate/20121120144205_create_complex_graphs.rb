class CreateComplexGraphs < ActiveRecord::Migration
  def change
    create_table :complex_graphs do |t|
      t.string :service
      t.string :section
      t.string :name
      t.references :created_by
      t.timestamps
    end
    add_index :complex_graphs, :created_by_id

    create_table :complex_graphs_graphs do|t|
      t.references :graph
      t.references :complex_graph
    end
  end
end
