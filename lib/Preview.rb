=begin

Modes:
1. Player vs Player
2. Player vs Computer
3. Computer vs Computer

I/O:

1. input: position of the piece, destination
2. ouput: the board which the pieces in its corresponding places

Setting:
Gamboard: 8 * 8. the grids are drawn in black and white.
The layout of the Gameboard and the pieces is setted.

Moves (Each piece has a determined movement pattern)
1. Pawn:
When the aimed square is unoccupied:
1ºturn 1/2 grid forward
>= 2ºturn 1 forward
When a opponents piece is on a square diagonally in front of it on an adjacent file.
capture that piece by moving to that square.

Special cases:
-En passant: when the opposite makes a two-step advance and end up next to an opponent's pawn.
Then opponent's pawn can capture it moving the square the pawn passed over.
-Promotion: When a pawn advances to the eighth rank, it must be exchanged for the player's choice of queen,rook,bishop or knight of the same color.

2.Rook:
Horizontally and Vertically.

Note: When there is a piece in the middle, we cannot pass over it directly.

3.King
Moves one square in any direction.

Special case:
-Castling: When King and Rook have not made a move yet, the king is not threatened, and there are not pieces in the middle.
The King move two square along the first rank toward a rook, and the rook on the last square that the king crossed.

4.Bishop
Diagonally

5.Queen

Combination of Bishop, Rook and King

6.Knight
1/2 steps horizontally + 2/1 steps vertically

Note: the only piece that can leap over other pieces.

General rules

- Capture: when two pieces of different color match in the same square, delete the static grid.

- Check: when the king is under immediate attack, it is compulsory to react to keep it safe. When can do it by:
  1. moving the queen. Note: when the destination is not threatened.
  2. Interposing a piece between the checking piece and the king.

- A movement must be made in each turn.

Ending of the Game

Win/Lose
Checkmate: check and no legal movement to escape
Resignation: resign
Win on time: time control

Draw
Stalemale: No check, no legal move to make.
Agreement: Yes/Yes -Player/Player
Dead position: checkmate is not possible
Threefold repetition: neither side is able to avoid repeating moves without incurring a disadvantage.
3.times in the same position.

=end
