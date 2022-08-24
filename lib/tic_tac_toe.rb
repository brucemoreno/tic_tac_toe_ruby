# frozen_string_literal: true

require_relative "tic_tac_toe/version"


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
  board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  
  def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "---|---|---"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "---|---|---"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, player_character)
  board[index] = player_character
end

def valid_move?(board, index)
  if index.between?(0,8) && !position_taken?(board, index)
    return true
  else
    
    puts "Invalid move"
  end
end

def position_taken?(board, index)
  if (board[index] == "") || (board[index] == " ") || (board[index] == nil)
    return false
  else
    return true
  end
end

def turn_count(board)
  counter = 0
  board.each do |spaces|
    if spaces == "X" || spaces == "O"
      counter = counter + 1
    end
    
  end
  counter
end

def current_player(board)
turn_count(board) % 2 == 0? "X": "O"
end

def turn(board)
  puts "Please enter 1 - 9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def won?(board)
WIN_COMBINATIONS.each do |win_combo|
  win_index_1 = win_combo[0]
  win_index_2 = win_combo[1]
  win_index_3 = win_combo[2]

  position_1 = board[win_index_1]
  position_2 = board[win_index_2]
  position_3 = board[win_index_3]
  if position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1)
    return win_combo
  end
end 
  return false
end


def full?(board)
  if board.any?{|index| index == nil || index ==" "}
    return false
  else
    return true
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  elsif 
    !full?(board) && !won?(board)
    return false
  else won?(board)
    return false
  end
end

def over?(board)
  if draw?(board) || full?(board) || won?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  else
    return false
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations player #{board[won?(board)[0]]}"
  else
    draw?(board)
    puts "Draw game"
  end
end

def only_X_O?(board)
  board.each do |check_char|
    accepted_char = check_char
    if accepted_char != "X" || "O"
      return false
    else
      return true
    end
  end
end