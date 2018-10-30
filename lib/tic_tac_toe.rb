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
    move(board, user_input, "X")
    display_board(board)
  else
    puts "Invalid move. Let's try again."
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |space|
    space == "X" || space == "O" ? counter += 1 : false
  end
  counter
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if (board[combo[0]].strip == board[combo[1]].strip &&
        board[combo[0]].strip == board[combo[2]].strip &&
        !(board[combo[0]].strip.empty?))
      return combo
    end
  end
  false
end

def full?(board)
  board.none? { |position| position.strip.empty? }
end

def draw?(board)
  won_state = won?(board)
  full_state = full?(board)
  if won_state || (full_state == false && won_state == false)
    false
  elsif won?(board) == false && full?(board)
    true
  end
end

def over?(board)
  won?(board) || draw?(board) || full?(board) ? true : false
end

def winner(board)
  won?(board) ? board[won?(board)[0]] : nil
end
