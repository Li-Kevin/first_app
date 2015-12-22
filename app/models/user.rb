class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	has_secure_password
	validates :name, presence: true, length: { maximum: 30 } #which sets requured and length maximum
      	validates :email, format: { with: /\A[@]+@[^@]+\z/}, uniqueness: true
end
