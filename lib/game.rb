# game.rb
# frozen_string_literal: false

require 'json'
require_relative 'board'
require_relative 'update_game'

require 'rainbow'
using Rainbow

# Class setup to take care of game logic and game flow.
# rubocop: disable Metrics/ClassLength
class Game
  def initialize
    @update_game = UpdateGame.new
    @board = Board.new
    @used = []
  end

  # rubocop: disable Metrics
  def play_game
    @update_game.random_word
    load_game if prompt_load_game

    blank = @update_game.instance_variable_get(:@blank_array) || @update_game.blank_word

    puts "\n#{blank.join(' ')}\n\n"

    while @update_game.wrong_guess < 12
      letter = @update_game.player_guess

      used = used_letters(letter)
      puts "Used letters: #{used.join(', ').blue}"
      @update_game.correct_guess?

      blank = @update_game.update_blank_word(blank)
      puts "\n#{blank.join(' ')}\n\n"

      wrong = @update_game.wrong unless letter.length > 2
      @update_game.new_guess
      update_display(wrong)

      if letter == 'savegame'
        save_game
        next
      elsif letter == 'loadgame'
        load_game
        blank = @update_game.instance_variable_get(:@blank_array)
        next
      end

      game_over?(blank.join(' '), @update_game.instance_variable_get(:@random_word))
      puts "\nWrong guess: #{wrong}/12\n\n"
    end

    # rubocop: disable Layout/LineLength
    puts "You lost! Better luck next time. The word was: #{@update_game.instance_variable_get(:@random_word)}\n".red.bold
    # rubocop: enable Layout/LineLength
  end
  # rubocop: enable Metrics

  # rubocop: disable Metrics
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
  # rubocop: enable Metrics

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

  # rubocop: disable Metric/MethodLength
  def save_game
    data = {
      update_game: {
        wrong_guess: @update_game.wrong_guess,
        random_word: @update_game.instance_variable_get(:@random_word),
        player_guess: @update_game.instance_variable_get(:@player_guess),
        blank_array: @update_game.instance_variable_get(:@blank_array),
        included: @update_game.instance_variable_get(:@included)
      },
      used: @used
    }

    File.open('savegame.json', 'w') do |file|
      file.write(JSON.generate(data))
    end

    puts "\nGame saved succesfully!\n".green
  end

  # rubocop: disable Metric/AbcSize
  def load_game
    if File.exist?('savegame.json')
      data = JSON.parse(File.read('savegame.json'))

      @update_game = UpdateGame.new
      @update_game.instance_variable_set(:@wrong_guess, data['update_game']['wrong_guess'])
      @update_game.instance_variable_set(:@random_word, data['update_game']['random_word'])
      @update_game.instance_variable_set(:@player_guess, data['update_game']['player_guess'])
      @update_game.instance_variable_set(:@blank_array, data['update_game']['blank_array'])
      @update_game.instance_variable_set(:@included, data['update_game']['included'])
      @used = data['used']

      blank_word = @update_game.instance_variable_get(:@blank_array)
      puts "This is where you were up to #{blank_word.join(' ')}\n"

      wrong_guess_count = @update_game.wrong_guess
      puts "\nWrong guess count: #{wrong_guess_count}/12\n"

      update_display(@update_game.wrong_guess)

      puts "\nGame loaded successfully! You've already made the following guesses: #{@used.join(', ')}\n".green
    else
      puts "\nNo saved game found.\n".red
    end
  end
  # rubocop: enable all

  def prompt_load_game
    print "\nDo you want to load the previous game? (y/n): "
    gets.chomp.downcase == 'y'
  end
end
