# update_game.rb
# frozen_string_literal: true

require_relative 'random_word'
require_relative 'player_guess'

class UpdateGame
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

  def update_blank_word
    word_array = @random_word.split('')
    blank_array = blank_word
    index_array = []

    word_array.each_with_index do |letter, index|
      index_array << index if @player_guess == letter
    end

    index_array.each do |num|
      blank_array[num] = @player_guess
    end

    blank_array = blank_array.join
  end
end

check = UpdateGame.new
check.random_word
check.player_guess
check.blank_word
puts check.update_blank_word
