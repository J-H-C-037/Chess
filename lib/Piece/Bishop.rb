require_relative "Piece.rb"


class Bishop < Piece
  def initialize(colour, position)
    @colour = colour
    @position = position
  end

  def legal_movements(content)
    legal_movements = Array.new
    if Piece.mypiece?(@colour, @position, content) != true
      puts "Invalid address"
      return legal_movements
    else
      block_upright = false
      block_upleft = false
      block_downright = false
      block_downleft = false

      (1..7).to_a.each do |step|
        #upside
        #right
        legal_move = [@position[0] + step, ((@position[1].codepoints)[0] + step).chr]

        if Piece.piece?(legal_move,content) == false and block_upright == false
          legal_movements << legal_move
        else
          if Piece.mypiece?(@colour, legal_move, content) == false and block_upright == false
            legal_movements << legal_move
            block_upright = true
          else
            block_upright = true
          end
        end

        #left
        legal_move = [@position[0] + step, ((@position[1].codepoints)[0] - step).chr]

        if Piece.piece?(legal_move,content) == false and block_upleft == false
          legal_movements << legal_move
        else
          if Piece.mypiece?(@colour, legal_move, content) == false and block_upleft == false
            legal_movements << legal_move
            block_upleft = true
          else
            block_upleft = true
          end
        end

        #downside
        #right
        legal_move = [@position[0] - step, ((@position[1].codepoints)[0] + step).chr]

        if Piece.piece?(legal_move,content) == false and block_downright == false
          legal_movements << legal_move
        else
          if Piece.mypiece?(@colour, legal_move, content) == false and block_downright == false
            legal_movements << legal_move
            block_downright = true
          else
            block_downright = true
          end
        end
        #left
        legal_move = [@position[0] - step, ((@position[1].codepoints)[0] - step).chr]
        if Piece.piece?(legal_move,content) == false and block_downleft == false
          legal_movements << legal_move
        else
          if Piece.mypiece?(@colour, legal_move, content) == false and block_downleft == false
            legal_movements << legal_move
            block_downleft = true
          else
            block_downleft = true
          end
        end
      end
      for move in legal_movements
        if check_position(move) == "Invalid address"
            legal_movements.delete(move)
        end
      end
      legal_movements.uniq().sort()
      #print "Legal moves of bishop: "
      #p legal_movements
      return legal_movements
    end
  end
end
