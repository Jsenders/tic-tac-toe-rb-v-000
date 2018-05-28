WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[0,3,6],[1,4,7],[2,5,8]]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  token = current_player(board)
  if valid_move?(board,index)
      puts 'valid move'
      move(board, index, token)
      display_board(board)
     else
      puts 'try again'
      turn(board)
    end
    display_board(board)
  end
  
def turn_count(board)
end

def current_player(board)
end

def won?(board)
WIN_COMBINATIONS.each do |array|
    if array.all? { |value| board[value] =="X" } || array.all? { |value| board[value] =="O" }
      return array
    end
  end
  return false
end

def full?(board)
  !board.any? { |x| x == " " }
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

  def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  else
  end
end

def play(board)
  until over?(board) == true || won?(board) != false
  puts 'turn'
    turn(board)
  end
  if winner(board)
    puts "Congratulations!"
  elsif draw?(board)
    puts "Cat's Game!"
  else
    return nil
  end
end
