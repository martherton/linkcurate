class Linkcat < ActiveRecord::Base
	belongs_to :user
	has_many :wlinks
	validates :linkcatname, presence: true, uniqueness: true
	validates :descofcont, presence: true
end
