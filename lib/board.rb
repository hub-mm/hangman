# board.rb
# frozen_string_literal: false

require 'rainbow/refinement'
using Rainbow

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
    puts board_bottom.red
  end

  def display_column
    puts board_column.red
    puts board_column.red
    puts board_column.red
    puts board_column.red
    puts board_column.red
    puts board_column.red
    puts board_column.red
    puts board_bottom.red
  end

  def display_top
    puts board_top.red
    puts board_column.red
    puts board_column.red
    puts board_column.red
    puts board_column.red
    puts board_column.red
    puts board_column.red
    puts board_column.red
    puts board_bottom.red
  end

  def display_rope
    puts board_top.red
    puts board_column.red << board_rope.red
    puts board_column.red
    puts board_column.red
    puts board_column.red
    puts board_column.red
    puts board_column.red
    puts board_column.red
    puts board_bottom.red
  end

  def display_head
    puts board_top.red
    puts board_column.red << board_rope.red.red
    puts board_column.red << board_head.red
    puts board_column.red
    puts board_column.red
    puts board_column.red
    puts board_column.red
    puts board_column.red
    puts board_bottom.red
  end

  def display_shoulders
    puts board_top.red
    puts board_column.red << board_rope.red.red
    puts board_column.red << board_head.red
    puts board_column.red << board_shoulders.red
    puts board_column.red
    puts board_column.red
    puts board_column.red
    puts board_column.red
    puts board_bottom.red
  end

  def display_chest
    puts board_top.red
    puts board_column.red << board_rope.red
    puts board_column.red << board_head.red
    puts board_column.red << board_shoulders.red
    print board_column.red
    puts board_chest_top.red
    puts board_column.red << board_chest_bottom.red
    puts board_column.red
    puts board_column.red
    puts board_bottom.red
  end

  def display_arm_left
    puts board_top.red
    puts board_column.red << board_rope.red
    puts board_column.red << board_head.red
    puts board_column.red << board_shoulders.red
    print board_column.red << board_arm_left.red
    puts board_chest_top.delete(' ').red
    puts board_column.red << board_chest_bottom.red
    puts board_column.red
    puts board_column.red
    puts board_bottom.red
  end

  def display_arm_right
    puts board_top.red
    puts board_column.red << board_rope.red
    puts board_column.red << board_head.red
    puts board_column.red << board_shoulders.red
    print board_column.red << board_arm_left.red
    print board_chest_top.delete(' ').red
    puts board_arm_right.red
    puts board_column.red << board_chest_bottom.red
    puts board_column.red
    puts board_column.red
    puts board_bottom.red
  end

  def display_leg_left
    puts board_top.red
    puts board_column.red << board_rope.red
    puts board_column.red << board_head.red
    puts board_column.red << board_shoulders.red
    print board_column.red << board_arm_left.red
    print board_chest_top.delete(' ').red
    puts board_arm_right.red
    puts board_column.red << board_chest_bottom.red
    puts board_column.red << board_leg_left.red
    puts board_column.red
    puts board_bottom.red
  end

  def display_leg_right
    puts board_top.red
    puts board_column.red << board_rope.red
    puts board_column.red << board_head.red
    puts board_column.red << board_shoulders.red
    print board_column.red << board_arm_left.red
    print board_chest_top.delete(' ').red
    puts board_arm_right.red
    puts board_column.red << board_chest_bottom.red
    print board_column.red << board_leg_left.red
    puts board_leg_right.red
    puts board_column.red
    puts board_bottom.red
  end

  def display_game_over
    puts board_top.red
    puts board_column.red << board_rope.red
    puts board_column.red << board_head_x.red
    puts board_column.red << board_shoulders.red
    print board_column.red << board_arm_left.red
    print board_chest_top.delete(' ').red
    puts board_arm_right.red
    puts board_column.red << board_chest_bottom.red
    print board_column.red << board_leg_left.red
    puts board_leg_right.red
    puts board_column.red
    puts board_bottom.red
  end
end
