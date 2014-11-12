class CreateWlinks < ActiveRecord::Migration
  def change
    create_table :wlinks do |t|
    	t.string :wlinkname
    	t.string :urlwlink
    	t.string :descwlink
    	t.integer :user_id
    	t.integer :votes_count
      t.timestamps
    end
  end
end
