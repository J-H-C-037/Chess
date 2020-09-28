=begin
class piece
  class pawn, rook, etc. inherit from class piece

class game
menu.
control whether it is turn for player or robot, whether we win or not. save or load.
end
class Player
the actions a player can do
end
class robot
the actions a robot do
end
=end

class Game
  def initialize
    @gameboard = new_game_board()
  end

  def new_game_board()
    return Array(1..8).product(Array("a".."h"))
  end

  def start_game()
    puts "Welcome, I suppose that you already know the rules"
    load_saved_game?()
    puts %(
      1. Human vs Human
      2. Human vs Computer
      3. Computer vs Computer
    Enter which mode you want to play:)


    mode = gets.chomp().to_i until [1,2,3].include?(mode)

    if mode == 1
      player_1 = Human.new
      player_2 = Human.new
    elsif mode == 2
      player_1 = Human.new
      player_2 = Computer.new
    else
      player_1 = Computer.new
      player_2 = Computer.new
    end


  end

  def save_load_game?
  end

  def mode()
  end
  def save_game()
  end
  def win?
  end
end

test = Game.new
p test.start_game
