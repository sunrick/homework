require 'pry'
require 'set'

board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
winning_combos = board.each_slice(3).to_a + [[1,4,7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
winning_combos = winning_combos.to_set

def play_game?
  result = nil
  puts dash_line
  puts "Do you want to play tic-tac-toe? y/n"
  puts dash_line
  user_input = gets.chomp
  until ['y','n'].include?(user_input.downcase)
    puts dash_line
    puts "Sorry I didn't understand...please enter again: y/n"
    puts dash_line
    user_input = gets.chomp
  end
  if user_input == "y"
    result = true
  else
    result = false
  end
  result
end

def play_computer?
  result = nil
  puts dash_line
  puts "Do you want to play against another player or the computer? p/c"
  puts dash_line
  user_input = gets.chomp
  until ['p','c'].include?(user_input.downcase)
    puts dash_line
    puts "Sorry I didn't understand...please enter again: p/c"
    puts dash_line
    user_input = gets.chomp
  end
  if user_input == "p"
    result = false
    puts dash_line
    puts "You have chosen to play an another player!"
    puts dash_line
  else
    result = true
    puts dash_line
    puts "You have chosen to play the computer!"
    puts dash_line
  end
  result
end

#visual formatting
def show_board(board)
  puts
  board = board.each_slice(3).to_a
  board.each do |row|
    puts row.join("-").center(dash_line.length)
  end
  puts
end

def dash_line
  result = "-"*80
end

def dash_length
  dash_line.length
end

def whose_turn?(turn_count)
  result = nil
  if turn_count.odd?
    result = "player1"
  else
    result = "player2"
  end
  result
end

def get_player_input(player, board)
  puts dash_line
  puts "Pick a move #{player}: "
  puts dash_line
  user_input = gets.chomp.to_i
  puts dash_line
  until input_valid?(user_input, board)
    puts dash_line
    puts "Invalid input..."
    puts dash_line
    user_input = gets.chomp.to_i
  end
  user_input
end

def choose_computer_move(player1_moves, player2_moves)
  result = nil
  possible_moves = (1..9).to_set
  available_moves = (player1_moves + player2_moves) ^ possible_moves
  result = available_moves.to_a.sample
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
    puts dash_line
    puts "#{player_win} wins!"
    puts dash_line
    result = true
  elsif player_win == "Player 2"
    puts dash_line
    puts "#{player_win} wins!"
    puts dash_line
    result = true
  else
    if turn_count == 10 #turn_count starts at 1
      puts dash_line
      puts "Game over, nobody wins!"
      puts dash_line
      result = true
    else
      result = false
    end
  end
  result
end

def player_move(is_computer, player1_moves, player2_moves, current_player, board, winning_combos)
  result = nil
  if current_player == "player2"
    if is_computer
      result = choose_computer_move(player1_moves, player2_moves)
      puts dash_line
      puts "Computer has picked number #{result}!"
      puts dash_line
    else
      result = get_player_input(current_player, board)
    end
  else
    result = get_player_input(current_player, board)
  end
  result
end

def board_reset
  board = (1..9).to_a
end

def tic_tac_toe(board, winning_combos, is_play_computer)
  player1_moves = Set.new
  player2_moves = Set.new
  turn_count = 1
  show_board(board)
  until game_complete?(turn_count, player1_moves, player2_moves, winning_combos)
    current_player = whose_turn?(turn_count)
    the_move = player_move(is_play_computer, player1_moves, player2_moves, current_player, board, winning_combos)
    if current_player == "player1"
      player1_moves << the_move
    else
      player2_moves << the_move
    end
    board = update_board(board, the_move, current_player)
    show_board(board)
    turn_count += 1
  end
end

def main(board, winning_combos)
  while play_game?
    tic_tac_toe(board, winning_combos, play_computer?)
    board = board_reset
  end
end

binding.pry