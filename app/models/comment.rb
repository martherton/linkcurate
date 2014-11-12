class Comment < ActiveRecord::Base
	belongs_to :wlink
	belongs_to :user
end
