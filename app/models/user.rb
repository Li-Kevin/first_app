class User < ActiveRecord::Base
	has_secure_password
	validates :email, format: { with: /\A[@]+@[^@]+\z/}
end
