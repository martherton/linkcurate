class User < ActiveRecord::Base
	has_secure_password
	validates :username, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true
	validates :password, presence: true, confirmation: true, length: {minimum: 8}
	has_many :linkcats
	has_many :wlinks, through: :linkcats
	has_many :comments
end
