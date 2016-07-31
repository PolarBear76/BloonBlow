class Pin < ActiveRecord::Base
	belongs_to :user
	acts_as_votable
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "http://www.penguinstats.com/images/not-available.png"
  	validates :image, presence: true, file_size: { less_than: 2.gigabytes }
 	validates :description, presence: true
 	do_not_validate_attachment_file_type :image
end