# board.rb
# frozen_string_literal: false

class Board
  def board_top
    '___________'
  end

  def board_column
    ' |'
  end

  def board_bottom
    '------'
  end

  def board_rope
    '       |'
  end

  def board_head
    '       O'
  end

  def board_shoulders
    '      -+-'
  end

  def board_chest_top
    '       | '
  end

  def board_chest_bottom
    '       -'
  end

  def board_arm_left
    '     / '
  end

  def board_arm_right
    ' \\'
  end

  def board_leg_left
    '     _/ '
  end

  def board_leg_right
    '\\_'
  end

  def board_head_x
    '       X'
  end

  def display_bottom
    puts board_bottom
  end

  def display_column
    puts board_column
    puts board_column
    puts board_column
    puts board_column
    puts board_column
    puts board_column
    puts board_column
    puts board_bottom
  end

  def display_top
    puts board_top
    puts board_column
    puts board_column
    puts board_column
    puts board_column
    puts board_column
    puts board_column
    puts board_column
    puts board_bottom
  end

  def display_rope
    puts board_top
    puts board_column << board_rope
    puts board_column
    puts board_column
    puts board_column
    puts board_column
    puts board_column
    puts board_column
    puts board_bottom
  end

  def display_head
    puts board_top
    puts board_column << board_rope
    puts board_column << board_head
    puts board_column
    puts board_column
    puts board_column
    puts board_column
    puts board_column
    puts board_bottom
  end

  def display_shoulders
    puts board_top
    puts board_column << board_rope
    puts board_column << board_head
    puts board_column << board_shoulders
    puts board_column
    puts board_column
    puts board_column
    puts board_column
    puts board_bottom
  end

  def display_chest
    puts board_top
    puts board_column << board_rope
    puts board_column << board_head
    puts board_column << board_shoulders
    print board_column
    puts board_chest_top
    puts board_column << board_chest_bottom
    puts board_column
    puts board_column
    puts board_bottom
  end

  def display_arm_left
    puts board_top
    puts board_column << board_rope
    puts board_column << board_head
    puts board_column << board_shoulders
    print board_column << board_arm_left
    puts board_chest_top.delete(' ')
    puts board_column << board_chest_bottom
    puts board_column
    puts board_column
    puts board_column
    puts board_bottom
  end

  def display_arm_right
    puts board_top
    puts board_column << board_rope
    puts board_column << board_head
    puts board_column << board_shoulders
    print board_column << board_arm_left
    print board_chest_top.delete(' ')
    puts board_arm_right
    puts board_column << board_chest_bottom
    puts board_column
    puts board_column
    puts board_bottom
  end

  def display_leg_left
    puts board_top
    puts board_column << board_rope
    puts board_column << board_head
    puts board_column << board_shoulders
    print board_column << board_arm_left
    print board_chest_top.delete(' ')
    puts board_arm_right
    puts board_column << board_chest_bottom
    puts board_column << board_leg_left
    puts board_column
    puts board_bottom
  end

  def display_leg_right
    puts board_top
    puts board_column << board_rope
    puts board_column << board_head
    puts board_column << board_shoulders
    print board_column << board_arm_left
    print board_chest_top.delete(' ')
    puts board_arm_right
    puts board_column << board_chest_bottom
    print board_column << board_leg_left
    puts board_leg_right
    puts board_column
    puts board_bottom
  end

  def display_game_over
    puts board_top
    puts board_column << board_rope
    puts board_column << board_head_x
    puts board_column << board_shoulders
    print board_column << board_arm_left
    print board_chest_top.delete(' ')
    puts board_arm_right
    puts board_column << board_chest_bottom
    print board_column << board_leg_left
    puts board_leg_right
    puts board_column
    puts board_bottom
  end
end

# Test/Troubleshoot
show = Board.new
show.display_bottom
show.display_column
show.display_top
show.display_rope
show.display_head
show.display_shoulders
show.display_chest
show.display_arm_left
show.display_arm_right
show.display_leg_left
show.display_leg_right
show.display_game_over
