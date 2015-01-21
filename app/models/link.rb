class Link < ActiveRecord::Base
  belongs_to :email, dependent: :destroy
  
	TRACKING_TOKEN = "&click"

  def click
  	self.increment!(:clicks, 1)
  end
end
