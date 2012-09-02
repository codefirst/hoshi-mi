class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.references :graph_id
      t.timestamp :happend_at
      t.integer :number

      t.timestamps
    end
    add_index :logs, :graph_id_id
  end
end
