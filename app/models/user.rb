class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :pins, dependent: :destroy, through: :votes
    
	has_many :votes, dependent: :destroy

  validates :name, presence: true


def vote!(pin)
  self.votes.create!(pin_id: pin.id)
end

def unvote!(pin)
  vote = self.votes.find_by_pin_id(pin.id)
  vote.destroy!
end



end
