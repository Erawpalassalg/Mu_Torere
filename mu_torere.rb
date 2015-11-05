require_relative 'board'
require_relative 'mt_tools'

def recursive_require(file)
  puts file
  if File.directory?(file)
    Dir[file + '/*'].each { |inner_file| recursive_require(inner_file) }
  else
    require file
  end
end

recursive_require('./AI')

class Mu_torere
  attr_reader :game_board, :lost, :interface
  
   def initialize    
    @game_board = GameBoard.new
    @lost = false
    @current_player = nil
    @interface = Interface.new(@current_player)
    @ai = AI.new(
      AlphaBeta,
      ComplexHeuristic,
      'B'
    )
    #@ai2 = AI.new(
      #Alpha_Beta,
      #Maximize_Plays,
      #'B'
    #)   
   end
 
  def next_player
    @current_player = @current_player == 'A' ? 'B' : 'A'
  end
     
  def move(num)
    
      if @current_player == @ai.player
        @ai.play(@game_board)
        @current_player = @current_player == 'A' ? 'B' : 'A'
      elsif @game_board.can_be_moved(num, @current_player)
        @game_board.move(@num)
        @current_player = @current_player == 'A' ? 'B' : 'A'
      end 
         
  end
  
  
  def lost?
    you_lost if @game_board.lost?(@current_player)
  end

  def you_lost
    @lost = true
  end

end

window = Mu_torere.new
window.next_player
window.interface.show

