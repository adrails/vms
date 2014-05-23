class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :name
      t.boolean :is_active, :default => false, :null => false
      t.text :address
      t.string :email
      t.integer :user_id

      t.timestamps
    end
  end
end
