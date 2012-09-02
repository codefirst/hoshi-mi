class CreateGraphs < ActiveRecord::Migration
  def change
    create_table :graphs do |t|
      t.string :service
      t.string :section
      t.string :name
      t.string :color
      t.references :created_by
      t.string :secret

      t.timestamps
    end
  end
end
