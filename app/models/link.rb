class Link < ActiveRecord::Base
  belongs_to :email, dependent: :destroy
end
