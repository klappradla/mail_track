class Email < ActiveRecord::Base
	EMAIL_REGEX = /\A([\w+\-.]+)@[a-z\d\-]+(\.[a-z\d\-])*(\.{1}[a-z]+)\z/i
	NAMES = ["one", "two"]

	validates :recipient, presence: true, format: { with: EMAIL_REGEX }
	has_many :links, dependent: :delete_all

	def add_links
		2.times do |i|
			self.links.create(name: NAMES[i])
		end
	end
	
end
