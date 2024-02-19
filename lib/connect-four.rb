class ConnectFour

    def initialize
        @board = Array.new(6) { Array.new(7, " ") }
        @turns = 0
        @player_1 = "Player 1"
        @player_2 = "Player 2"
    end

    def print_board
        puts "+-+-+-+-+-+-+-+"
        @board.each_with_index do |row|
            puts "|" + row.join("|") + "|" 
            puts "+-+-+-+-+-+-+-+"
        end
        puts " 1 2 3 4 5 6 7"
    end
    
    def select_piece(player)

        player_id = (player == "O") ? @player_1 : @player_2

        loop do
        puts "#{player_id}, please enter the column where you want to put your jeton:"
        selected_piece = gets.chomp.to_i

        column = selected_piece - 1
        
        if column.between?(0, 6)
            row = find_lowest_empty_row(column)
            if row != nil
                @board[row][column] = player
                break
            else
                puts "Column is full. Please select a different column."
            end
        else
            puts "Invalid column. Please select a column between 1 and 7."
        end
        end
    end

    def find_lowest_empty_row(column)
        5.downto(0) do |row|
            return row if @board[row][column] == " "
        end
        nil
    end

    def round(number: 42)

        number.times do
            print_board

            @turns = @turns + 1

            piece = @turns % 2 == 0 ? "X" : "O"

            select_piece(piece)

            if player_win?(piece)
                end_game(piece)
                break
            end
        end
    end

    def player_win?(piece)
        @board.any? { |row| row.join.include?(piece * 4) } ||
        (0..6).any? { |col| @board.map { |row| row[col] }.join.include?(piece * 4) }

        diagonal_check(piece)
    end

    def diagonal_check(piece)
     
        (0..2).each do |row|
          (0..3).each do |col| 
            if @board[row][col] == piece &&
               @board[row + 1][col + 1] == piece &&
               @board[row + 2][col + 2] == piece &&
               @board[row + 3][col + 3] == piece
              return true
            end
          end
        end
      
        (3..5).each do |row| 
          (0..3).each do |col| 
            if @board[row][col] == piece &&
               @board[row - 1][col + 1] == piece &&
               @board[row - 2][col + 2] == piece &&
               @board[row - 3][col + 3] == piece
              return true
            end
          end
        end
      
        false
      end
      

    def end_game(piece)
        print_board

        player = (player == "O") ? @player_1 : @player_2

        puts "#{player} won! Would you like to play again? (yes/no)"

        loop do 
            answer = gets.chomp.to_s.downcase
            
            if answer == "yes"
                @board.clear
                @turns = 0
                @board = Array.new(6) { Array.new(7, " ") }
                round
                break
            elsif answer == "no"
                puts "Thank you for playing!"
                break
            else
               puts  'Invalid input, please enter "yes" or "no"'
            end
        end
    end

    def start_game
        puts "Welcome to Connect Four. Connect Four is played on a vertical board consisting of six rows and seven columns. Players choose a token and then take turns dropping them from the top into any of the seven columns."
        puts "Player 1, please enter your name:"
        @player_1 = gets.chomp.to_s
        puts "Player 2, please enter your name:"
        @player_2 = gets.chomp.to_s
        sleep(1)
        round
    end

end


