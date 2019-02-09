# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Last row
  [0,3,6], # Left coloumn
  [1,4,7], # Middle coloumn
  [2,5,8], # Right coloumn
  [0,4,8], # Left to right diagonal
  [2,4,6] # Right to left diagonal
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3
    position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1)
 end
end

#position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1)
#The above code means to return first element (position_1) & make sure the position is taken by X or O

def full?(board)
  board.all? {|index| index == "X" || index == "O"}
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if draw?(board) || won?(board)
    return true
  else
    return false
  end
end

def winner (board)
  win_position = won?(board)
  if win_position == false
    return nil
  else
    if board[win_position[0]] == "X"
      return "X"
    else
      return "O"
    end
  end
end
