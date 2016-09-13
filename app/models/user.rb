class User < ActiveRecord::Base
	has_one :photo
	has_secure_password
end
