class Pin < ActiveRecord::Base
	belongs_to :user

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "http://www.penguinstats.com/images/not-available.png"



  validates :image, presence: true
  validates :description, presence: true
end