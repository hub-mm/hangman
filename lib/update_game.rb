# update_game.rb
# frozen_string_literal: true

require_relative 'random_word'
require_relative 'player_guess'

class UpdateGame
  def initialize
    @wrong_guess = 0
  end

  def random_word
    @random_word = RandomWord.new.select_random_word
  end

  def player_guess
    @player_guess = PlayerGuess.new.player_guess
  end

  def blank_word
    word_length = @random_word.length
    Array.new(word_length - 1, '_')
  end

  def update_blank_word(blank_word)
    word_array = @random_word.split('')
    blank_array = blank_word

    word_array.each_with_index do |letter, index|
      blank_array[index] = @player_guess if letter == @player_guess
    end

    puts "wrong guess: #{@wrong_guess}"
    puts blank_array.join(' ')

    if !blank_array.include?('_')
      puts "\nCongratulations! You've guessed the word: #{@random_word}"
    else
      player_guess
      @wrong_guess += 1 unless @random_word.include?(@player_guess.to_s)
      update_blank_word(blank_array)
    end
  end
end

check = UpdateGame.new
check.random_word
# check.player_guess
blank = check.blank_word
check.update_blank_word(blank)
