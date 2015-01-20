class Link < ActiveRecord::Base
  belongs_to :email, dependent: :destroy

  def click
  	self.increment!(:clicks, 1)
  end
end
