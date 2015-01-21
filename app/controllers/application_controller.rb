class ApplicationController < ActionController::Base
	include LinksHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :track_click


  private

	def track_click
  	if request.url.include? Link::TRACKING_TOKEN
  		url = request.url.slice(0...(request.url.index(Link::TRACKING_TOKEN)))
  		Link.find(params[:id]).click
  		redirect_to url
	  end
  end
end
