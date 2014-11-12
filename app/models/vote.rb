class Vote < ActiveRecord::Base
	belongs_to :wlink, counter_cache: true
	validates :ip_address, uniqueness: { scope: :wlink}
end
