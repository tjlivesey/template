class User < ActiveRecord::Base
	EMAIL_REGEX = %r{[a-z0-9!#\$%&'*+\/=?^_`{|}~-]+(?:\.[a-z0-9!#\$%&'*+\/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?}i
	has_secure_password

	validates :password, presence: true, confirmation: true
	validates_format_of :password, :with => /\A.{6,}/, on: :create
	validates_format_of :email, :with => EMAIL_REGEX, multiline: false
	validates_uniqueness_of :email
end
