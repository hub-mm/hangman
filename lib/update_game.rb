# update_game.rb
# frozen_string_literal: true

require_relative 'random_word'
require_relative 'player_guess'

# Class setup to update neccesary info for game and avoid crowding game class.
class UpdateGame
  attr_reader :wrong_guess

  def initialize
    @wrong_guess = 0
    @included = nil
    @blank_array = nil
  end

  def random_word
    @random_word = RandomWord.new.select_random_word
  end

  def player_guess
    @player_guess = PlayerGuess.new.player_guess
  end

  def correct_guess?
    @included = if @random_word.include?(@player_guess)
                  true
                else
                  false
                end
  end

  def blank_word
    word_length = @random_word.length
    Array.new(word_length - 1, '_')
  end

  def update_blank_word(blank_word)
    return blank_word if @included == false

    @random_word.split('').each_with_index do |letter, index|
      blank_word[index] = letter if letter == @player_guess
    end

    @blank_array = blank_word
  end

  def new_guess
    update_blank_word(@blank_array)
  end

  def wrong
    @wrong_guess += 1 if @included == false
    @wrong_guess
  end
end
