WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
]

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

def move(board, index, token)
  board[index] = token
end

def position_taken?(board, index)
  board[index] == "X" || board[index] == "O" ? true : false
end

def valid_move?(board, index)
  index.between?(0, 8) && !(position_taken?(board, index)) ? true : false
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = input_to_index(gets.strip)

  if valid_move?(board, user_input)
    move(board, user_input)
    display_board(board)
  else
    puts "Invalid move. Let's try again."
    turn(board)
  end
end
