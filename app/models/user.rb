class User < ActiveRecord::Base
	has_one :photo
	has_secure_password
	validates :name, presence: true
end
