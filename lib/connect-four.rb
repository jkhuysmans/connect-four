#1: Define game board
#2: Print the board
#3: Add pieces to the board
#4: Check for a win
#5: Alternate turns

class ConnectFour

    def initialize
        @board = Array.new(6) { Array.new(7, "  ") }
    end

    def print_board
        puts "  +--+--+--+--+--+--+--+"
        @board.each_with_index do |row, index|
            puts "#{@board.length - index} " + "|" + row.join("|") + "|" # Adds walls to the left and right
            puts "  +--+--+--+--+--+--+--+"
        end
        puts "   a  b  c  d  e  f  g"
    end
    
end

game = ConnectFour.new
game.print_board
