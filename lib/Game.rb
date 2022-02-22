require "C:/ruby files/Games/Chess/lib/Player/Human.rb"
require "C:/ruby files/Games/Chess/lib/Player/Computer.rb"
class Game

  attr_accessor :gameboard, :content

  def initialize
    @gameboard = new_game_board()
    @content = position_to_content()
  end

  def new_game_board()
    return Array(1..8).product(Array("a".."h"))
  end

  def start_game()
    puts "Welcome, I suppose that you already know the rules"
    load_saved_game?()
    print %(
      1. Human vs Human
      2. Human vs Computer
      3. Computer vs Human
      4. Computer vs Computer
      5. Exit
    Enter which mode you want to play:)
    continue = true
    mode = gets.chomp().to_i until [1,2,3,4,5].include?(mode)
    case mode
    when 1
      player_1 = Human.new(0) #=> color 0 = black, 1 = white
      player_2 = Human.new(1)
    when 2
      player_1 = Human.new(0)
      player_2 = Computer.new(1)
    when 3
      player_1 = Computer.new(0)
      player_2 = Human.new(1)
    when 4
      player_1 = Computer.new(0)
      player_2 = Computer.new(1)
    when 5
      continue = false
    end
    starting_set_up()
    king_position_1 = [8,"d"]
    king_position_2 = [1,"d"]

    turn = 0

    loop do
    break if continue == false
      @@king_1_dead = false
      @@king_2_dead = false

      display(@content)
      puts "\nSample: 2a:4a"
      print "\nPlayer 1. Following the sample, write down your move: "


      king_move_1 = player_1.make_move(@content, king_position_1)
      if king_move_1 == "Check Mate"
        @@king_1_dead = true
        continue = false
      elsif king_move_1 == "Stalemale"
        continue = false
      elsif king_move_1 != nil #update king_position if neccesary
        king_position_1 = king_move_1
      end

    break if continue == false
      display(@content)

      print "\nPlayer 2. Following the example, write down your move: "
      king_move_2 = player_2.make_move(@content, king_position_2)

      if king_move_2 == "Check Mate"
        @@king_2_dead = true
        continue = false
      elsif king_move_2 == "Stalemale"
        continue = false
      elsif king_move_2 != nil
        king_position_2 = king_move_2
      end
      turn += 1
      continue = false if turn == 50
    end
    if mode != 5
      if @@king_1_dead == true
        puts "Player 2 has won"
      elsif @@king_2_dead == true
        puts "Player 1 has won"
      else
        puts "Draw"
      end

      game = Game.new
      game.start_game
    end

  end

  def starting_set_up()
    @content[[1,"d"]] = "_♚_"
    @content[[8,"d"]] = "_♔_"

    for i in ("a".."h").to_a
      @content[[7,i]] = "_♙_" #white
      @content[[2,i]] = "_♟︎" #black
    end

    @content[[1,"c"]] = "_♞_"
    @content[[1,"f"]] = "_♞_"
    @content[[8,"c"]] = "_♘_"
    @content[[8,"f"]] = "_♘_"

    @content[[1,"a"]] = "_♜_"
    @content[[1,"h"]] = "_♜_"
    @content[[8,"a"]] = "_♖_"
    @content[[8,"h"]] = "_♖_"

    @content[[1,"b"]] = "_♝_"
    @content[[1,"g"]] = "_♝_"
    @content[[8,"b"]] = "_♗_"
    @content[[8,"g"]] = "_♗_"

    @content[[1,"e"]] = "_♛_"
    @content[[8,"e"]] = "_♕_"

  end
=begin
@content[[1,"c"]] = "_♞_"
@content[[1,"f"]] = "_♞_"
@content[[8,"c"]] = "_♘_"
@content[[8,"f"]] = "_♘_"

@content[[1,"a"]] = "_♜_"
@content[[1,"h"]] = "_♜_"
@content[[8,"a"]] = "_♖_"
@content[[8,"h"]] = "_♖_"

@content[[1,"b"]] = "_♝_"
@content[[1,"g"]] = "_♝_"
@content[[8,"b"]] = "_♗_"
@content[[8,"g"]] = "_♗_"

@content[[1,"e"]] = "_♛_"
@content[[8,"e"]] = "_♕_"
=end

  def load_saved_game?
  end

  def win_or_draw?(check_mate = false)
    if check_mate == true
      puts "Game over"
      return check_mate
    else
      return false
    end #unless check_mate or dead_position or threefold_repetition or stalemale
  end

  def save_game() #save @content
  end

  def dead_position() #checkmate is not possible
  end

  def threefold_repetition() # both sides cannot avoid repeating a movement pattern without incurring a disadvantage
  end

  def position_to_content()
    position_to_content = Hash.new
    @gameboard.map {|position| position_to_content[position] = "___"} #map return a new array with the results while each is more like a primitive version of map because it always always give the original datas.
    return position_to_content
  end

  def display(position_to_content = position_to_content())
    key = 8 #notice that the table starts at the top left side to right. But when we display, we make sure that it its index coincides with the actual position in the displayed table in order to avoid possible confusion
    ((1..8).to_a).reverse.each do |i|
      puts "   ________________________________" if key == 8
      puts "#{i}  |#{position_to_content[[key, "a"]]}|#{position_to_content[[key, "b"]]}|#{position_to_content[[key,"c"]]}|#{position_to_content[[key,"d"]]}|#{position_to_content[[key, "e"]]}|#{position_to_content[[key, "f"]]}|#{position_to_content[[key,"g"]]}|#{position_to_content[[key, "h"]]}|"
      key -= 1
      sleep (0.1)
    end
    puts "     A   B   C   D   E   F   G   H"
    puts "Player 1 pieces: ♙, ♘, ♗, ♖, ♕, ♔"
    puts "Player 2 pieces: ♟︎ ♞, ♝, ♜, ♛, ♚"
  end
end

game = Game.new
game.start_game
