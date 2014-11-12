class Wlink < ActiveRecord::Base
	has_many :comments
	has_many :votes
	
	belongs_to :user
	belongs_to :linkcat, :foreign_key => 'linkcat_id'
	validates :urlwlink, presence: true, uniqueness: true
	validates :wlinkname, presence: true
	validates :descwlink, presence: true
end
