class Pin < ActiveRecord::Base
	belongs_to :user

	validates :description, presence: true

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "http://www.penguinstats.com/images/not-available.png"
validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
validates :image, presence: true
end