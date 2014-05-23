class CreateInviteLists < ActiveRecord::Migration
  def change
    create_table :invite_lists do |t|
      t.boolean :invited_status, :default => false, :null => false
      t.integer :vendor_id
      t.integer :project_id
      t.integer :invited_id
      t.integer :invitee_id
      t.datetime :invitation_sent_at
      t.timestamps
    end
  end
end
