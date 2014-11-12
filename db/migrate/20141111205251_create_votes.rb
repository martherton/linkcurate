class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
    	t.integer :wlink_id
    	t.string :ip_address
      t.timestamps
    end
  end
end
