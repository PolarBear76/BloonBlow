class User < ActiveRecord::Base
acts_as_followable
acts_as_follower
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :pins, dependent: :destroy

  validates :name, presence: true

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "https://www.coachup.com/static/images/missing-profile-photo.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  has_many :subscribed, class_name: "Relationship", foreign_key: "followed_id"
  has_many :followers, class_name: "Relationship", foreign_key: "follower_id"

end