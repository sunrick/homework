require 'pry'
require 'set'

WINS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1,4,7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]].to_set

def play_game?
  question = "Do you want to play tic-tac-toe? y/n"
  user_input = prompt_with_validation(question, /^[yn]$/i)
  result = user_input == "Y"
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

def player_letter(current_player)
  current_player == "Player 1" ? "X" : "O"
end

def dash_line
  result = "-"*80
end

def player_move(player, board)
  available_moves = board.select { |x| x.is_a? Integer}
  prompt = "Pick a move #{player}"
  result = prompt_with_validation(prompt, /^#{available_moves}$/i)
  result.to_i
end

def player_close?(moves)
  WINS.to_a.collect do |combo|
    result = combo - moves.to_a
    if result.length == 1
      result = result - moves.to_a
      result = result[0]
    end
  end
end

def valid_move?(moves, board)
  available_moves = board.select { |x| x.is_a? Integer}
  array = player_close?(moves)
  array.detect do |x|
    available_moves.include?(x)
  end
end

def computer_move(current_player, player1_moves, player2_moves, board)
  available_moves = board.select { |x| x.is_a? Integer}
  if available_moves.include?(5)
    result = 5
  else
    result = valid_move?(player2_moves, board)
    if result == nil
      result = valid_move?(player1_moves, board)
      if result == nil
        if (player1_moves.include?(4) || player1_moves.include?(2)) && available_moves.include?(1)
          result = 1
        elsif (player1_moves.include?(8) || player1_moves.include?(6)) && available_moves.include?(9)
          result = 9
        elsif available_moves.include?(3)
          result = 3
        else
          result = available_moves.sample
        end
      end
    end
  end
  puts dash_line
  puts "The computer has chosen #{result}!"
  puts dash_line
  result
end

def update_board(board, player_input, current_player)
  board[board.index(player_input)] = player_letter(current_player)
  board
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

def tic_tac_toe
  while play_game?
    board = (1 .. 9).to_a
    cpu_player = play_computer?
    player1_moves = Set.new
    player2_moves = Set.new
    current_player = "Player 1"
    until game_complete?(player1_moves, player2_moves, board)
      show_board(board)
      if cpu_player && current_player == "Player 2"
        the_move = computer_move(current_player, player1_moves, player2_moves, board)
      else
        the_move = player_move(current_player, board)
      end
      current_player == "Player 1" ? player1_moves << the_move : player2_moves << the_move
      board = update_board(board, the_move, current_player)
      current_player = current_player == "Player 1" ? "Player 2" : "Player 1"
    end
  end
end

tic_tac_toe

