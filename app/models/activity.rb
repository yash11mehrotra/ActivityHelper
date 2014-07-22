class Activity < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	
	mount_uploader :image, ImageUploader
	
	geocoded_by :address
	after_validation :geocode, :if => :address_changed?
end
