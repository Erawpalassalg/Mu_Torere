# encoding: UTF-8
# A simple piece of the board.
class Piece
    attr_accessor :x, :y
	
	def initialize(player)
	  
	 if player == 'A'
	 @image = Gosu::Image.new("media/pion/circle-red.png")
	 else @image = Gosu::Image.new("media/pion/circle-orange.png")
	 end
	 
	 @x = 0
	 @y = 0
	 @angle = 0.0
	 @z = ZOrder::Move
	end
	
	def draw
		@image.draw_rot(@x, @y, @z, @angle)
	end
end
