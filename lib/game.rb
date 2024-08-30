# game.rb
# frozen_string_literal: false

require_relative 'board'
require_relative 'update_game'

class Game
  def initialize
    @update_game = UpdateGame.new
    @board = Board.new
  end

  def play_game
    @update_game.random_word
    blank = @update_game.blank_word

    while @update_game.wrong_guess < 12
      @update_game.player_guess
      puts @update_game.update_blank_word(blank).join(' ')
      @update_game.correct_guess?
      @update_game.new_guess
      wrong = @update_game.wrong
      puts "Wrong guess: #{wrong}"
      update_display(wrong)
    end
  end

  def update_display(wrong)
    case wrong
    when 1
      @board.display_bottom
    when 2
      @board.display_column
    when 3
      @board.display_top
    when 4
      @board.display_rope
    when 5
      @board.display_head
    when 6
      @board.display_shoulders
    when 7
      @board.display_chest
    when 8
      @board.display_arm_left
    when 9
      @board.display_arm_right
    when 10
      @board.display_leg_left
    when 11
      @board.display_leg_right
    when 12
      @board.display_game_over
    end
  end
end

play = Game.new
play.play_game
