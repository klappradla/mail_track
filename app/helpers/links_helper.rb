module LinksHelper

	def tracking_url(link)
		"#{link_url link}#{Link::TRACKING_TOKEN}"
	end
end
