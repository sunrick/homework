require 'pry'

board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

def play_game?
  puts "Do you want to play tic-tac-toe? y/n"
  user_input = gets.chomp
  until ['y','n'].include?(user_input.downcase)
    puts "Sorry I didn't understand...please enter again: y/n"
    user_input = gets.chomp
  end
end

def show_board(board)
  board.each do |row|
    puts row.join
  end
end

def user_move
  puts "Pick a move:"
  user_input = gets.chomp.to_i
end

def update_board(board, user_move, user_letter)
  board = board.flatten
  if board.include?(user_move)
    board[board.index(user_move)] = user_letter
  else
  end
  board = board.each_slice(3).to_a
end

#returns letter X for player 1, 0 player
def whose_turn?(turn_count)
  if turn_count.odd?
    result = "X"
  else
    result = "O"
  end
  result
end

def game_finished?(board)
  result = false
  if vertical_check(board) || horizontal_check(board) || diagonal_check(board)
    result = true
  end
  result
end

def vertical_check(board)
  result = false
  board = board.flatten
  if unique_array?(board.values_at(0,3,6)) || unique_array?(board.values_at(1,4,7)) || unique_array?(board.values_at(2,5,8))
    result = true
  end
  result
end

def diagonal_check(board)
  result = false
  board = board.flatten
  if unique_array?(board.values_at(0,4,8)) || unique_array?(board.values_at(2,4,6))
    result = true
  end
  result
end

def horizontal_check(board)
  result = false
  board.each do |row|
    if unique_array?(row)
      result = true
      break
    end
  end
  result
end

def unique_array?(array)
  result = false
  if array.uniq.length == 1
    result = true
  end
  result
end

def tic_tac_toe (board)
  turn_count = 1
  while turn_count < 10
    if !game_finished?(board)
      board = update_board(board, user_move, whose_turn?(turn_count))
      show_board(board)
      turn_count += 1
    else
      turn_count = 10
    end
  end
  puts "The game is over!"
end

def main(board)
  play_game?
  show_board(board)
  tic_tac_toe(board)
end


# winning combinations

#horizontal
# [1,2,3]
# [4,5,6]
# [7,8,9]
# #vertical
# [1,4,7]
# [2,5,8]
# [3,6,9]
# #diagonal
# [1,5,9]
# [2,3,7]



binding.pry