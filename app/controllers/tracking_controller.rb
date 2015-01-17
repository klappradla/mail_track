class TrackingController < ApplicationController
	TRACKING_IMAGE_PATH = File.join(Rails.root, "app", "assets", "images", "tracking.gif")

	def image
		puts "FUCKYEAHFUCKYEAHFUCKYEAHFUCKYEAHFUCKYEAH"
		send_file TRACKING_IMAGE_PATH
	end
	
end