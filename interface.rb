require 'gosu'
require_relative 'piece'

module ZOrder
  Background, Move, Player, UI = *0..3
end

class Interface  < Gosu::Window
  
  def initialize(current_player)
    @current_player = nil
    super 631, 634
    self.caption = "Mu Torere"
    @background_image = Gosu::Image.new("media/plateau.jpg", :tileable => true)
    @num = 0
    @Score = Gosu::Font.new(20)
    @ScoreUpdate = "Rouge : 0 / 0 : Jaune"
    @Position1 = Gosu::Font.new(20)
    @Position2 = Gosu::Font.new(20)
    @Position3 = Gosu::Font.new(20)
    @Position4 = Gosu::Font.new(20)
    @Position5 = Gosu::Font.new(20)
    @Position6 = Gosu::Font.new(20)
    @Position7 = Gosu::Font.new(20)
    @Position8 = Gosu::Font.new(20)
    @Position9 = Gosu::Font.new(20)
    @player = Gosu::Font.new(20)
    
    @coordinates = [[314, 40], [120, 122], [37,317], [119, 512], [314, 595], [509,512], [592, 317], [509, 122], [314,317]]
    
    if !piece_board
      @piece_board = []
      8.times do |xy|
        @piece_board << Piece.new(@piece_board.length > 3 ? 'B' : 'A')
        @piece_board[-1].x = @coordinates[xy][0]
        @piece_board[-1].y = @coordinates[xy][1]
      end
    else
      @piece_board = piece_board
    end
    @putahi = putahi
   
  end
  
  def update
       if button_down? Gosu::Button::KbNumpad1
        @num = 1
       elsif button_down? Gosu::Button::KbNumpad2
          @num = 2
       elsif button_down? Gosu::Button::KbNumpad3
          @num = 3
       elsif button_down? Gosu::Button::KbNumpad4
          @num = 4
       elsif button_down? Gosu::Button::KbNumpad5
          @num = 5
       elsif button_down? Gosu::Button::KbNumpad6
          @num = 6
       elsif button_down? Gosu::Button::KbNumpad7
          @num = 7
       elsif button_down? Gosu::Button::KbNumpad8
          @num = 8
       elsif button_down? Gosu::Button::KbNumpad9
          @num = 9
       end
       
       @game_board.can_be_moved(@num, @current_player)
       @_board.move(@num)
       @current_player = @current_player == 'A' ? 'B' : 'A'
       
  end
  
    
  def draw
    @background_image.draw(0,0,0)
    @Score.draw("#{@ScoreUpdate}", 10, 10, 0, 1.0, 1.0, 0xff_000000) #"Player A : #{@playerRouge.score} / #{@playerJaune.score} : Player B"
    @Position1.draw("1", 310, 200, 0, 1.0, 1.0, 0xff_000000)
    @Position2.draw("2", 248, 245, 0, 1.0, 1.0, 0xff_000000)
    @Position3.draw("3", 208, 304, 0, 1.0, 1.0, 0xff_000000)
    @Position4.draw("4", 248, 365, 0, 1.0, 1.0, 0xff_000000)
    @Position5.draw("5", 310, 406, 0, 1.0, 1.0, 0xff_000000)
    @Position6.draw("6", 373, 365, 0, 1.0, 1.0, 0xff_000000)
    @Position7.draw("7", 407, 304, 0, 1.0, 1.0, 0xff_000000)
    @Position8.draw("8", 373, 245, 0, 1.0, 1.0, 0xff_000000)
    @Position9.draw("9", 310, 304, 0, 1.0, 1.0, 0xff_000000)
    @player.draw("Player #{@current_player} de jouer", 10, 30, 0, 1.0, 1.0, 0xff_ff0000)
    
    @piece_board .each do |piece|
      piece.draw if piece != nil 
    end
  
    @putahi.draw if @putahi != nil
  end
  
  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end
end