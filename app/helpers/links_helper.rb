module LinksHelper
	TRACKING_TOKEN = "&click"

	def tracking_url(link)
		url = "#{link_url link}#{TRACKING_TOKEN}"
	end

	def track_click
  	if request.url.include? TRACKING_TOKEN
  		url = request.url.slice(0...(request.url.index(TRACKING_TOKEN)))
  		log_click(request.url)
  		redirect_to url
	  end
  end

  def log_click(url)
  	puts "hellyeahhellyeahhellyeahhellyeahhellyeah"
  end
end
