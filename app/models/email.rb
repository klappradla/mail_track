class Email < ActiveRecord::Base
	EMAIL_REGEX = /\A([\w+\-.]+)@[a-z\d\-]+(\.[a-z\d\-])*(\.{1}[a-z]+)\z/i

	validates :recipient, presence: true, format: { with: EMAIL_REGEX }
end
