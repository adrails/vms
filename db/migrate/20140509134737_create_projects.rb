class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.boolean :is_active, :default => false, :null => false
      t.integer :vendor_id
      t.integer :user_id
      t.string :services_ids

      t.timestamps
    end
  end
end
