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

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  index = input.strip.to_i - 1
end

def valid_move?(board, index)
  if position_taken?(board, index) == false && index.between?(0,8)
    true
  else
    false
  end
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    false
  else
    true
  end
end

def move(board, index, token)
  if valid_move?(board, index)
    board[index] = token
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if move(board, index, token = "X")
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  board.select{|i| i == "X" || i == "O"}.length
end

def current_player(board)
  if turn_count(board).even?
    "X"
  else
    "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    win_combination.all?{|index| board[index] == "X"} || win_combination.all?{|index| board[index] == "O"}
  end
end

def full?(board)
  board.all?{|index| index == "X" || index == "O"}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  if won?(board) && current_player(board) == "O"
    "X"
  elsif won?(board) && current_player(board) == "X"
    "O"
  end
  #if won?(board) && won?(board).all?{|index| board[index] == "X"}
  #  "X"
  #elsif won?(board) && won?(board).all?{|index| board[index] == "O"}
  #  "O"
  #end
end

def play(board)
  turn(board)
end
