require 'pry'
require 'set'

WINS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1,4,7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]].to_set

def play_game?
  question = "Do you want to play tic-tac-toe? y/n"
  user_input = prompt_with_validation(question, /^[yn]$/i)
  result = user_input == "Y" ? true : false
end

def play_computer?
  question = "Do you want to play against another player or the computer? p/c"
  user_input = prompt_with_validation(question, /^[pc]$/i)
  if user_input == "P"
    puts dash_line
    puts "You have chosen to play an another player!"
    puts dash_line
    result = false
  else
    puts dash_line
    puts "You have chosen to play the computer!"
    puts dash_line
    result = true
  end
end

def prompt_with_validation(prompt, regex)
  puts dash_line
  puts prompt
  puts dash_line
  result = gets.chomp
  until result =~ regex
    puts dash_line
    puts "Sorry your input is not valid..."
    puts dash_line
    result = gets.chomp
  end
  result.upcase
end

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

def choose_move(player, board)
  available_moves = board.select { |x| x.is_a? Integer}
  prompt = "Pick a move #{player}"
  result = prompt_with_validation(prompt, /^#{available_moves}$/i)
  result.to_i
end

def choose_computer_move(board)
  available_moves = board.select { |x| x.is_a? Integer}
  result = available_moves.to_a.sample
end

def update_board(board, player_input, current_player)
  board[board.index(player_input)] = player_letter(current_player)
  board
end

def player_letter(current_player)
  current_player == "Player 1" ? "X" : "O"
end

def player_win?(player1_moves, player2_moves)
  result = nil
  WINS.each do |combo|
    if combo.to_set.subset?(player1_moves)
      result = "Player 1"
    elsif combo.to_set.subset?(player2_moves)
      result = "Player 2"
    end
  end
  result
end

def draw?(board)
  board.all? {|x| x.is_a? String}
end

def game_complete?(player1_moves, player2_moves, board)
  player_win = player_win?(player1_moves, player2_moves)
  if player_win == "Player 1" || player_win == "Player 2"
    puts dash_line
    puts "#{player_win} wins!"
    puts dash_line
    show_board(board)
    result = true
  elsif draw?(board)
    puts dash_line
    puts "Game over, nobody wins!"
    puts dash_line
    show_board(board)
    result = true
  else
    result = false
  end
end

def player_move(is_computer, current_player, board)
  if current_player == "Player 2" && is_computer
    result = choose_computer_move(board)
    puts dash_line
    puts "Computer has picked number #{result}!"
    puts dash_line
    result
  elsif current_player == "Player 2"
    result = choose_move(current_player, board)
  else
    result = choose_move(current_player, board)
  end
end

def tic_tac_toe
  while play_game?
    board = (1 .. 9).to_a
    cpu_player = play_computer?
    player1_moves = Set.new
    player2_moves = Set.new
    current_player = "Player 1"
    until game_complete?(player1_moves, player2_moves, board)
      show_board(board)
      the_move = player_move(cpu_player, current_player, board)
      current_player == "Player 1" ? player1_moves << the_move : player2_moves << the_move
      board = update_board(board, the_move, current_player)
      current_player = current_player == "Player 1" ? "Player 2" : "Player 1"
    end
  end
end

tic_tac_toe

binding.pry

