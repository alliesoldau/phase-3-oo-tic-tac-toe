class TicTacToe


    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    WIN_COMBINATIONS = [
        [0,1,2], # Top row
        [3,4,5], # Middle row
        [6,7,8], # Bottom row
        [0,3,6], # 1st column
        [1,4,7], # 2nd column
        [2,5,8], # 3rd column
        [0,4,8], # Diagnal 1
        [2,4,6] # Diagnal 2
    ]

    def display_board 
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index input
        input.to_i - 1
    end

    def move index, token = "X"
        @board[index] = token
    end

    def position_taken? index
        if @board[index] == " "
            false
        else
            true
        end
    end

    def valid_move? position
        !position_taken?(position) && position.between?(0,8)
    end

    def turn_count
        @board.count{|position| position != " "}
    end

    def current_player
        turn_count.odd? ? "O" : "X" 
    end

    def turn
        puts "Please enter a number (1-9):"
        input = gets
        index = input_to_index(input)
        if valid_move? index
            @board[index] = current_player
        else 
            turn
        end
        display_board
    end

    def won? 
        WIN_COMBINATIONS.any? do |combo|
            if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
                return combo
            end
        end
    end

    def full?
        @board.all? {|square| square != " " }
    end

    def draw?
        full? && !won?
    end

    def over?
        draw? || won?
    end

    def winner
        if combo = won?
          @board[combo[0]]
        end
    end

    def play 
        turn until over?
        puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
    end
end