class Addlinkcatid < ActiveRecord::Migration
  def change
  	add_column :wlinks, :linkcat_id, :integer
  end
end
