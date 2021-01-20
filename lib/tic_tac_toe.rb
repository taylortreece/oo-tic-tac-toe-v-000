require 'pry'


class TicTacToe

  WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]
    ]

    def initialize
        @board = Array.new(9, " ")
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(user_input)
        user_input.to_i - 1
    end

    def move(user_input, token=x)
        @board[user_input] = token
    end

    def position_taken?(user_input)
        @board[user_input] == " " ? false : true
    end

    def valid_move?(user_input)
        !position_taken?(user_input) && user_input.between?(0, 8)
    end

    def turn_count
        @board.count{|token| token == "X" || token == "O"}
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end

    def turn
        puts "Please enter 1-9"
        user_input = gets.strip.to_i - 1
        input_to_index(user_input)
        if valid_move?(user_input)
            move(user_input, current_player)
        else
            turn
        end
        display_board
    end

    def won?
        if @board[0...8] == " "
            return false
        else
        WIN_COMBINATIONS.find do |win_combo|
            win_index_1 = win_combo[0]
            win_index_2 = win_combo[1]
            win_index_3 = win_combo[2]
        
            @board[win_index_1] == @board[win_index_2] && @board[win_index_2] == @board[win_index_3] && position_taken?(win_index_1)
            end
        end
    end

    def full?
        @board.include?(" ")  ? false : true
    end

    def draw?
        if !won? && full?
            return true
        else
            return false
        end
    end

    def over?
        if won? || full?
            return true
        else
            false
        end
    end

    def winner 
    WIN_COMBINATIONS.detect do |combo| 
          if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" 
            return "X"
          elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
            return "O"
          else 
            nil
          end
        end
    end

    def play
        until over? || draw? || won?
            turn
        end

        if won?
            puts "Congratulations #{winner}!"
        else
            puts "Cat's Game!"
        end
    end

    


end









