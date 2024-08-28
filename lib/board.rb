# board.rb

class Board
  def initialize
    @board = display_board
  end

  def board_top
    top = '___________'
  end

  def board_column
    column = ' |'
  end

  def board_bottom
    bottom = '------'
  end

  def board_rope
    rope = '       |'
  end

  def board_head
    head = '       O'
  end

  def board_shoulders
    shoulders = '      -+-'
  end

  def board_chest_top
    chest = ' | '
  end

  def board_chest_botom
    chest = '       -'
  end

  def board_arm_left
    arm_left = '     /'
  end

  def board_arm_right
    arm_right = '\\'
  end

  def board_leg_left
    leg_left = '     _/ '
  end

  def board_leg_right
    leg_right = '\\_'
  end

  def display_board
    puts board_top
    puts board_column << board_rope
    puts board_column << board_head
    puts board_column << board_shoulders
    print board_column << board_arm_left
    print board_chest_top
    puts board_arm_right
    puts board_column << board_chest_botom
    print board_column << board_leg_left
    puts board_leg_right
    puts board_column
    puts board_bottom
  end
end

show = Board.new
