class CreateLinkcats < ActiveRecord::Migration
  def change
    create_table :linkcats do |t|
    	t.string :linkcatname
    	t.string :descofcont
    	t.integer :user_id
      t.timestamps
    end
  end
end
