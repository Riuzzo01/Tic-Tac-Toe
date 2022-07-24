class Board
  @@grids = {a1: nil,
             a2: nil,
             a3: nil,
             b1: nil,
             b2: nil,
             b3: nil,
             c1: nil,
             c2: nil,
             c3: nil}

  public

  def play(position, value)
    @@grids[position] = value
  end
  
  public

  def display
    puts "    #{@@grids[:a1]} | #{@@grids[:a2]} | #{@@grids[:a3]}"
    puts "    --+---+--" 
    puts "    #{@@grids[:b1]} | #{@@grids[:b2]} | #{@@grids[:b3]}"
    puts "    --+---+--"
    puts "    #{@@grids[:c1]} | #{@@grids[:c2]} | #{@@grids[:c3]}"
  end

  def getGrid
    @@grids
  end
end

class Player 
  attr_accessor :player_symbol  
end

class Game
  def initialize(player1, player2)
    puts "Do you want to play"
    response = gets.chomp
    while response == "yes"
      board = Board.new
      turn = 1
      endGame = false
      while !endGame && turn != 10
        board.display
        if turn.odd?
          puts "Player1: choose your move..."
          move = gets.chomp
          board.play("#{move}".to_sym, player1.player_symbol)
        else
          puts "Player2: choose your move..."
          move = gets.chomp
          board.play("#{move}".to_sym, player2.player_symbol)
        end

        if wonCondition(board) == true 
          puts "Game END!!!"
          endGame = true
        end

        turn += 1
      end
      if turn == 10 && !endGame
        puts "It's a TIE!!!"
      end
      
      puts "One more game?"
      response = gets.chomp
    end
  end

  def wonCondition(board)
    if board.getGrid[:a1] == board.getGrid[:a2] && board.getGrid[:a1] == board.getGrid[:a3] && board.getGrid[:a1] != nil
      true
    elsif board.getGrid[:b1] == board.getGrid[:b2] && board.getGrid[:b1] == board.getGrid[:b3] && board.getGrid[:b1] != nil
      true
    elsif board.getGrid[:c1] == board.getGrid[:c2] && board.getGrid[:c1] == board.getGrid[:c3] && board.getGrid[:c1] != nil
      true
    elsif board.getGrid[:a1] == board.getGrid[:b1] && board.getGrid[:a1] == board.getGrid[:c1] && board.getGrid[:a1] != nil
      true
    elsif board.getGrid[:a2] == board.getGrid[:b2] && board.getGrid[:a2] == board.getGrid[:c2] && board.getGrid[:a2] != nil
      true
    elsif board.getGrid[:a3] == board.getGrid[:b3] && board.getGrid[:a3] == board.getGrid[:c3] && board.getGrid[:a3] != nil
      true
    elsif board.getGrid[:a1] == board.getGrid[:b2] && board.getGrid[:a1] == board.getGrid[:c3] && board.getGrid[:a1] != nil
      true
    elsif board.getGrid[:a3] == board.getGrid[:b2] && board.getGrid[:a3] == board.getGrid[:c1] && board.getGrid[:c1] != nil
      true
    else
      false
    end
  end
end


player1 = Player.new()
player1.player_symbol = "X"
player2 = Player.new()
player2.player_symbol = "O"

game = Game.new(player1, player2)
