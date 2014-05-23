class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.boolean :is_active, :default => false, :null => false
      t.integer :vendor_id

      t.timestamps
    end
  end
end
