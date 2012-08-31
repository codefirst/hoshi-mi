class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.integer :uid
      t.string :name
      t.string :icon_url

      t.timestamps
    end

    add_index :users, :uid,                :unique => true
    add_index :users, :name,               :unique => true
  end
end
