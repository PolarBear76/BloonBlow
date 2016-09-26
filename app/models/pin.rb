class Pin < ActiveRecord::Base
	belongs_to :user
	scope :subscribed, ->(followers) { where user_id: followers }
	acts_as_votable
	# acts_as_taggable
	# acts_as_commentable
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "http://www.penguinstats.com/images/not-available.png"
  	validates :image, presence: true, file_size: { less_than: 2.gigabytes }
 	validates :description, presence: true
 	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end