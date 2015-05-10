require 'pry'
require 'set'

board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
winning_combos = board.each_slice(3).to_a + [[1,4,7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
winning_combos = winning_combos.to_set

def play_game?
  result = nil
  puts "Do you want to play tic-tac-toe? y/n"
  user_input = gets.chomp
  until ['y','n'].include?(user_input.downcase)
    puts "Sorry I didn't understand...please enter again: y/n"
    user_input = gets.chomp
  end
  if user_input == "y"
    result = true
  else
    result = false
  end
  result
end

def show_board(board)
  board = board.each_slice(3).to_a
  board.each do |row|
    puts row.join
  end
end

def whose_turn?(turn_count)
  if turn_count.odd?
    "player1"
  else
    "player2"
  end
end

def get_player_input(player, board)
  puts "Pick a move #{player}: "
  user_input = gets.chomp.to_i
  until input_valid?(user_input, board)
    puts "Invalid input..."
    user_input = gets.chomp.to_i
  end
  user_input
end

def input_valid?(player_input, board)
  result = nil
  if (1..9).to_a.include?(player_input)
    if board.include?(player_input) == false
      result = false
    else
      result = true
    end
  else
    result = false
  end
  result
end

def update_board(board, player_input, current_player)
    board[board.index(player_input)] = player_letter(current_player)
    board
end

def player_letter(current_player)
  if current_player == "player1"
    "X"
  else
    "O"
  end
end

def player_win?(player1_moves, player2_moves, winning_combos)
  result = nil
  winning_combos.each do |combo|
    if combo.to_set.subset?(player1_moves)
      result = "Player 1"
    elsif combo.to_set.subset?(player2_moves)
      result = "Player 2"
    end
  end
  result
end

def game_complete?(turn_count, player1_moves, player2_moves, winning_combos)
  
  result = nil
  player_win = player_win?(player1_moves, player2_moves, winning_combos)

  if player_win == "Player 1"
    puts "#{player_win} wins!"
    result = true
  elsif player_win == "Player 2"
    puts "#{player_win} wins!"
    result = true
  else
    if turn_count == 10 #turn_count starts at 1
      puts "Game over, nobody wins!"
      result = true
    else
      result = false
    end
  end
  result
end

def board_reset
  board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
end


def tic_tac_toe(board, winning_combos)
  
  player1_moves = Set.new
  player2_moves = Set.new
  turn_count = 1

  show_board(board)

  until game_complete?(turn_count, player1_moves, player2_moves, winning_combos)
    
    current_player = whose_turn?(turn_count)
    player_input = get_player_input(current_player, board)
    
    if current_player == "player1"
      player1_moves << player_input
    else
      player2_moves << player_input
    end

    board = update_board(board, player_input, current_player)
    show_board(board)

    turn_count += 1
  end
end

def main(board, winning_combos)
  while play_game?
    tic_tac_toe(board, winning_combos)
    board = board_reset
  end
end

binding.pry