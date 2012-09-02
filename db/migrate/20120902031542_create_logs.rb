class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.references :graph
      t.timestamp :happened_at
      t.integer :number

      t.timestamps
    end
    add_index :logs, :graph_id
  end
end
