class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]

      # commentable = Pin.create
  # comment = commentable.comments.create
  # comment.title = "First comment."
  # comment.comment = "This is the first comment."
  # comment.save


  def index
     # @pins = Pin.subscribed current_user.followers
     @pins = Pin.all.order("created_at DESC")
  end

  def show
  end

  def add_new_comment
    pin = Pin.find(params[:id])
    pin.comments << Pin.new(params[:comment])
    redirect_to :action => :show, :id => pin
  end

  def new
    @pin = current_user.pins.build
  end

  def edit
  end

  def create
    @pin = current_user.pins.build(pin_params)
    if @pin.save
      redirect_to @pin, notice: 'Bloon was successfully blown.'
    else
      render action: 'new'
    end
  end

  def update
    if @pin.update(pin_params)
      redirect_to @pin, notice: 'Bloon was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @pin.destroy
    redirect_to pins_url
  end

  def upvote
  @pin = Pin.find(params[:id])
  @pin.upvote_by current_user
  redirect_to pins_path
end

def downvote
  @pin = Pin.find(params[:id])
  @pin.downvote_by current_user
  redirect_to pins_path
end

def self.score
  self.get_upvotes.size - self.get_downvotes.size
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pin
      @pin = Pin.find(params[:id])
    end

    def correct_user
      @pin = current_user.pins.find_by(id: params[:id])
      redirect_to pins_path, notice: "Not authorized to edit this bloon" if @pin.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pin_params
      params.require(:pin).permit(:description, :image, :tag_list)
    end

    

end
