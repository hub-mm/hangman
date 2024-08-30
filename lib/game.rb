# game.rb
# frozen_string_literal: false

require_relative 'board'
require_relative 'update_game'

require 'rainbow'
using Rainbow

class Game
  def initialize
    @update_game = UpdateGame.new
    @board = Board.new
    @used = []
  end

  def play_game
    random_word = @update_game.random_word
    blank = @update_game.blank_word
    puts "\n#{blank.join(' ')}\n\n"

    while @update_game.wrong_guess < 12
      letter = @update_game.player_guess
      used = used_letters(letter)
      puts "Used letters: #{used.join(', ').blue}"
      @update_game.correct_guess?

      word = @update_game.update_blank_word(blank).join(' ')
      puts "\n#{word}\n\n"

      wrong = @update_game.wrong
      @update_game.new_guess
      update_display(wrong)

      game_over?(word, random_word)
      puts "\nWrong guess: #{wrong}/12\n\n"
    end

    puts "You lost! Better luck next time. The word was: #{random_word}\n".red.bold
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

  def used_letters(letter)
    @used << letter
  end

  def game_over?(word, random_word)
    if !word.split('').include?('_')
      puts "\nCongratulations! You guessed the word: #{random_word}\n".green.bold
      exit
    else
      false
    end
  end
end
